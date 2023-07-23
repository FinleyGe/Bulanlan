package types

type LoginRequest struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

type RegisterRequest struct {
	Email    string `json:"email"`
	Password string `json:"password"`
	Name     string `json:"name"`
}

type APIUser struct {
	Email string `json:"email"`
	Name  string `json:"name"`
	Level string `json:"level"`
	Tags  []Tag  `json:"tags"`
}

type UpdateUserLevelRequest struct {
	Level string `json:"level"`
}

type UpdateUserTagsRequest struct {
	Tags []string `json:"tags"`
}
