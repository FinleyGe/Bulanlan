package utility

import (
	"bulanlan/RESTfulAPI/types"
	"strings"

	"github.com/xuri/excelize/v2"
	"golang.org/x/exp/slices"
)

func readExcel(filePath string) ([][]string, error) {
	f, err := excelize.OpenFile(filePath)
	if err != nil {
		return nil, err
	}
	rows, err := f.GetRows("Sheet1")
	if err != nil {
		return nil, err
	}
	return rows, nil
}

func GetTags(file string) []types.Tag {
	rows, err := readExcel(file)
	if err != nil {
		panic(err)
	}
	tags := []types.Tag{}

	for _, row := range rows {
		tag := row[2]
		if tag == "/" {
			continue
		} else if strings.Contains(tag, "，") {
			for _, t := range strings.Split(tag, "，") {
				if slices.Contains(tags, types.Tag{Name: t}) {
					continue
				}
				tags = append(tags, types.Tag{Name: t})
			}
		} else {
			if slices.Contains(tags, types.Tag{Name: tag}) {
				continue
			}
			tags = append(tags, types.Tag{Name: tag})
		}
	}
	return tags
}

func GetBooks(file string) []types.Book {
	rows, err := readExcel(file)
	if err != nil {
		panic(err)
	}

	books := []types.Book{}

	for _, row := range rows {
		book := types.Book{
			Name:   row[0],
			Author: row[1],
			Level:  row[3],
		}
		tag := row[2]
		if tag == "/" {
			book.Tags = []types.Tag{}
		} else if strings.Contains(tag, "，") {
			for _, t := range strings.Split(tag, "，") {
				book.Tags = append(book.Tags, types.Tag{Name: t})
			}
		} else {
			book.Tags = append(book.Tags, types.Tag{Name: tag})
		}
		books = append(books, book)
	}
	return books
}
