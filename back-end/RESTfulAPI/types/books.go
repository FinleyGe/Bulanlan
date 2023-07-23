package types

type Book struct {
	Name   string `json:"name"`
	Author string `json:"author"`
	URL    string `json:"url"`
	Level  string `json:"level"`
	Tags   []Tag  `json:"tags"`
}

type Tag struct {
	Name string `json:"name"`
}
