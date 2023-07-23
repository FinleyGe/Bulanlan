package controllerGRPC

import (
	"bulanlan/api"
	"bulanlan/db/model"
	"bulanlan/utility"
	"context"
	"log"
	// "log"
)

type UserSeviceServer struct {
	api.UnimplementedUserServiceServer
}

func (s *UserSeviceServer) Login(ctx context.Context, req *api.LoginRequest) (*api.LoginResponse, error) {
	var ret api.LoginResponse
	var response api.Response

	pwd := utility.Encrypt(req.Password)
	ok, id := model.ValidUser(req.Email, pwd)
	if ok {
		token := utility.GenereateToken(id)
		response.Code = 200
		msg := "Login success"
		response.Msg = &msg
		ret.Token = token
	} else {
		response.Code = 400
		msg := "Login failed"
		response.Msg = &msg
	}
	ret.Response = &response
	return &ret, nil
}

func (s *UserSeviceServer) Register(ctx context.Context, req *api.RegisterRequest) (*api.Response, error) {
	var ret = &api.Response{}
	pwd := utility.Encrypt(req.Password)
	user := model.User{
		Email:    req.Email,
		Password: pwd,
		Name:     req.Name,
		Profile:  model.Profile{},
	}
	if err := model.AddUser(&user); err != nil {
		ret.Code = 500
		msg := "Interval Server Error"
		ret.Msg = &msg
		return ret, nil
	}
	ret.Code = 200
	msg := "success"
	ret.Msg = &msg
	return ret, nil
}

func (s *UserSeviceServer) GetBooks(ctx context.Context, req *api.Request) (*api.GetBooksResponse, error) {
	var ret = &api.GetBooksResponse{}
	var response = &api.Response{}
	token := req.Token
	id := utility.ParseToken(token)
	if id == 0 {
		response.Code = 400
		msg := "Invalid token"
		response.Msg = &msg
		ret.Response = response
		return ret, nil
	}
	books := model.GetRecommendBooks(id)
	// log.Println(books)
	if len(books) == 0 {
		response.Code = 400
		msg := "No books"
		response.Msg = &msg
		ret.Response = response
	}
	var api_books []*api.Book
	for _, book := range books {
		api_book := &api.Book{
			Name:   book.Name,
			Url:    book.Link,
			Level:  book.Level,
			Author: book.Author,
		}
		tags := book.Tags
		api_tags := []*api.Tag{}
		for _, tag := range tags {
			api_tag := &api.Tag{
				Name: tag.Name,
			}
			api_tags = append(api_tags, api_tag)
		}
		api_book.Tags = api_tags
		api_books = append(api_books, api_book)
	}
	log.Println(api_books)
	ret.Books = api_books
	response.Code = 200
	msg := "success"
	response.Msg = &msg
	ret.Response = response

	return ret, nil
}

func (s *UserSeviceServer) GetTags(ctx context.Context, req *api.Request) (*api.GetTagsResponse, error) {
	token := req.Token
	id := utility.ParseToken(token)
	var ret = &api.GetTagsResponse{}
	var response = &api.Response{}
	if id == 0 {
		response.Code = 400
		msg := "Invalid token"
		response.Msg = &msg
		ret.Response = response
		return ret, nil
	}

	tags := model.GetAllTags()
	var api_tags []*api.Tag
	for _, tag := range tags {
		api_tag := &api.Tag{
			Name: tag.Name,
		}
		api_tags = append(api_tags, api_tag)
	}
	ret.Tags = api_tags
	response.Code = 200
	msg := "success"
	response.Msg = &msg
	ret.Response = response
	return ret, nil
}

func (s *UserSeviceServer) GetUserInfo(ctx context.Context, req *api.Request) (*api.GetUserInfoResponse, error) {
	var ret = &api.GetUserInfoResponse{}
	var response = &api.Response{}

	token := req.Token
	id := utility.ParseToken(token)
	if id == 0 {
		response.Code = 400
		msg := "Invalid token"
		response.Msg = &msg
		ret.Response = response
		return ret, nil
	}
	user, err := model.GetUserByID(id)
	if err != nil {
		response.Code = 500
		msg := "Interval Server Error"
		response.Msg = &msg
		ret.Response = response
		return ret, nil
	}

	tags := user.Profile.Tags
	userinfo_tags := []*api.Tag{}
	for _, tag := range tags {
		t := &api.Tag{
			Name: tag.Name,
		}
		userinfo_tags = append(userinfo_tags, t)
	}
	ret.UserInfo = &api.UserInfo{
		Name:  user.Name,
		Email: user.Email,
		Level: user.Profile.Level,
		Tags:  userinfo_tags,
	}
	response.Code = 200
	msg := "success"
	response.Msg = &msg
	ret.Response = response
	return ret, nil
}
func (s *UserSeviceServer) UpdateUserLevel(ctx context.Context, req *api.UpdateUserLevelRequest) (*api.Response, error) {
	var ret = &api.Response{}
	token := req.Token
	id := utility.ParseToken(token)
	if id == 0 {
		ret.Code = 400
		msg := "Invalid token"
		ret.Msg = &msg
		return ret, nil
	}
	err := model.UpdateUserLevel(id, req.Level)
	if err != nil {
		ret.Code = 500
		msg := "Interval Server Error"
		ret.Msg = &msg
		return ret, nil
	}
	ret.Code = 200
	msg := "success"
	ret.Msg = &msg
	return ret, nil
}

func (s *UserSeviceServer) UpdateUserTags(ctx context.Context, req *api.UpdateUserTagsRequest) (*api.Response, error) {
	var ret = &api.Response{}
	token := req.Token
	id := utility.ParseToken(token)
	if id == 0 {
		ret.Code = 400
		msg := "Invalid token"
		ret.Msg = &msg
		return ret, nil
	}
	var tagNames []string
	for _, tag := range req.Tags {
		tagNames = append(tagNames, tag.Name)
	}
	err := model.UpdateUserTags(id, tagNames)
	if err != nil {
		ret.Code = 500
		msg := "Interval Server Error"
		ret.Msg = &msg
		return ret, nil
	}
	ret.Code = 200
	msg := "success"
	ret.Msg = &msg
	return ret, nil
}
