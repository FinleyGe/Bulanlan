package controller

import (
	"bulanlan/RESTfulAPI/types"
	"bulanlan/db/model"
	"bulanlan/utility"
	"log"

	"github.com/gin-gonic/gin"
)

func GetBooks(c *gin.Context) {
	db_books := model.GetAllBooks()
	log.Println(db_books)
	var books []types.Book
	for _, db_book := range db_books {
		var tags []types.Tag
		for _, db_tag := range db_book.Tags {
			tags = append(tags, types.Tag{
				Name: db_tag.Name,
			})
		}
		books = append(books, types.Book{
			Name:   db_book.Name,
			Author: db_book.Author,
			URL:    db_book.Link,
			Level:  db_book.Level,
			Tags:   tags,
		})
	}
	utility.Response(c, 200, "success", books)
}

func AddBook(c *gin.Context) {
	var book types.Book
	if err := c.ShouldBindJSON(&book); err != nil {
		utility.Response(c, 400, "Bad Request", nil)
		return
	}
	var db_book model.Book
	db_book.Name = book.Name
	db_book.Author = book.Author
	db_book.Link = book.URL
	db_book.Level = book.Level
	for _, tag := range book.Tags {
		db_book.Tags = append(db_book.Tags, model.Tag{Name: tag.Name})
	}
	if err := model.AddBook(db_book); err != nil {
		utility.Response(c, 500, "Interval Server Error", nil)
		return
	}
	utility.Response(c, 200, "success", nil)
}

func GetBookCount(c *gin.Context) {
	count := model.GetBookCount()
	utility.Response(c, 200, "success", gin.H{"count": count})
}

func UploadBookList(c *gin.Context) {
	file, err := c.FormFile("file")
	if err != nil {
		utility.Response(c, 400, "Bad Request", nil)
		return
	}
	if err := c.SaveUploadedFile(file, "book_list.xlsx"); err != nil {
		utility.Response(c, 500, "Interval Server Error", nil)
		return
	}
	tags := utility.GetTags("book_list.xlsx")
	for _, tag := range tags {
		if err := model.AddTag(model.Tag{Name: tag.Name}); err != nil {
			// if err.Error() != "UNIQUE constraint failed: tags.name" {
			// 	utility.Response(c, 500, "Interval Server Error", nil)
			// 	return
			// }
			continue
		}
	}
	books := utility.GetBooks("book_list.xlsx")
	for _, book := range books {
		var db_book model.Book
		db_book.Name = book.Name
		db_book.Author = book.Author
		db_book.Link = book.URL
		db_book.Level = book.Level
		for _, tag := range book.Tags {
			db_book.Tags = append(db_book.Tags, model.Tag{Name: tag.Name})
		}
		log.Println(db_book)
		if err := model.AddBook(db_book); err != nil {
			continue
		}
	}
	utility.Response(c, 200, "success", nil)
}

func GetRecommendBooks(c *gin.Context) {
	id := c.GetUint("id")
	books := model.GetRecommendBooks(id)
	var recommend_books []types.Book
	for _, book := range books {
		var tags []types.Tag
		for _, tag := range book.Tags {
			tags = append(tags, types.Tag{Name: tag.Name})
		}
		recommend_books = append(recommend_books, types.Book{
			Name:   book.Name,
			Author: book.Author,
			URL:    book.Link,
			Level:  book.Level,
			Tags:   tags,
		})
	}
	utility.Response(c, 200, "success", recommend_books)
}
