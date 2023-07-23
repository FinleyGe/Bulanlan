package model

import (
	"bulanlan/db"

	"gorm.io/gorm"
)

type Book struct {
	gorm.Model
	Name   string `gorm:"type:varchar(100);not null;unique"`
	Author string
	Link   string
	Level  string
	Tags   []Tag `gorm:"many2many:book_tags;"`
}

type Tag struct {
	gorm.Model
	Name string `gorm:"type:varchar(100);not null;unique"`
}

func GetAllBooks() []Book {
	var books []Book
	db.DB.Preload("Tags").Find(&books)
	return books
}

func GetAllTags() []Tag {
	var tags []Tag
	db.DB.Find(&tags)
	return tags
}

func GetTagByName(name string) (Tag, error) {
	var tag Tag
	err := db.DB.Where("name = ?", name).First(&tag).Error
	return tag, err
}

func AddBook(book Book) error {
	tags := []Tag{}
	for _, tag := range book.Tags {
		var t Tag
		db.DB.Where("name = ?", tag.Name).First(&t)
		tags = append(tags, t)
	}
	book.Tags = tags
	return db.DB.Transaction(func(tx *gorm.DB) error {
		if err := tx.Create(&book).Error; err != nil {
			return err
		}
		return nil
	})
}

func AddTag(tag Tag) error {
	// ignore the error if the tag already exists
	return db.DB.Transaction(func(tx *gorm.DB) error {
		if err := tx.Create(&tag).Error; err != nil {
			return err
		}
		return nil
	})
}

func UpdateBookTags(book Book) error {
	return db.DB.Model(&book).Association("Tags").Replace(&book.Tags)
}

func GetBookCount() int64 {
	var count int64
	db.DB.Model(&Book{}).Count(&count)
	return count
}

func GetRecommendBooks(id uint) []Book {
	var books []Book
	var user User
	db.DB.Preload("Profile").Preload("Profile.Tags").Where("id = ?", id).First(&user)
	db.DB.Preload("Tags").Where("level = ?", user.Profile.Level).Find(&books)
	var recommendBooks []Book
	if len(books) < 10 {
		// same level book is not enough
		recommendBooks = books
	} else {
		// same level book is enough
		// so we need to get the book that has the same tags with the user
		for _, book := range books {
			var flag bool
			flag = false
			for _, tag := range book.Tags {
				for _, userTag := range user.Profile.Tags {
					if tag.Name == userTag.Name {
						recommendBooks = append(recommendBooks, book)
						flag = true
						break
					}
				}
				if flag {
					break
				}
			}
		}
	}

	if len(recommendBooks) < 10 {
		for _, book := range books {
			var flag bool
			flag = false
			for _, recommendBook := range recommendBooks {
				if book.Name == recommendBook.Name {
					flag = true
					break
				}
			}
			if !flag {
				recommendBooks = append(recommendBooks, book)
			}
			if len(recommendBooks) == 10 {
				break
			}
		}
	}
	return recommendBooks
}
