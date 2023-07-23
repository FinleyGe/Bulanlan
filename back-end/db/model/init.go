package model

import (
	. "bulanlan/db"
)

func init() {
	DB.AutoMigrate(&User{}, &Book{}, &Tag{}, &Admin{}, &Profile{})
}
