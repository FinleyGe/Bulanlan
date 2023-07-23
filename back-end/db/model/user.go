package model

import (
	. "bulanlan/db"
	"gorm.io/gorm"
)

type User struct {
	gorm.Model
	Name     string `gorm:"type:varchar(100);not null"`
	Email    string `gorm:"type:varchar(100);not null;unique"`
	Password string `gorm:"type:varchar(100);not null"`
	Profile  Profile
}

type Profile struct {
	gorm.Model
	UserID uint
	Tags   []Tag `gorm:"many2many:profile_tags;"`
	Level  string
}

type Admin struct {
	gorm.Model
	UserID uint
}

func AddUser(user *User) error {
	return DB.Transaction(func(tx *gorm.DB) error {
		if err := tx.Create(user).Error; err != nil {
			return err
		}
		profile := Profile{UserID: user.ID}
		if err := tx.Create(&profile).Error; err != nil {
			return err
		}
		return nil
	})
}

func GetUserByEmail(email string) (User, error) {
	var user User
	err := DB.Where("email = ?", email).First(&user).Error
	return user, err
}

func GetUserByID(id uint) (User, error) {
	var user User
	err := DB.Preload("Profile").Preload("Profile.Tags").Where("id = ?", id).First(&user).Error
	return user, err
}

func ValidUser(email string, password string) (bool, uint) {
	var user User
	DB.Where("email = ?", email).First(&user)
	if user.ID == 0 {
		return false, 0
	}
	return (user.Password == password), user.ID
}

func IsAdmin(id uint) bool {
	var admin Admin
	DB.Where("user_id = ?", id).First(&admin)
	return admin.ID != 0
}

func GetUserCount() int64 {
	var count int64
	DB.Model(&User{}).Count(&count)
	return count
}

func UpdateUserLevel(id uint, level string) error {
	return DB.Model(&Profile{}).Where("user_id = ?", id).Update("level", level).Error
}

func UpdateUserTags(id uint, tag_names []string) error {
	var tags []Tag
	DB.Where("name in ?", tag_names).Find(&tags)
	var profile Profile
	DB.Where("user_id = ?", id).First(&profile)
	return DB.Model(&profile).Association("Tags").Replace(&tags)
}
