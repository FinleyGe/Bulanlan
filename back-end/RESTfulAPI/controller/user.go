package controller

import (
	"bulanlan/RESTfulAPI/types"
	"bulanlan/config"
	"bulanlan/db/model"
	"bulanlan/utility"
	"log"
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
)

func Login(c *gin.Context) {
	loginRequest := &types.LoginRequest{}
	if err := c.ShouldBindJSON(loginRequest); err != nil {
		log.Println("Login error: ", err)
		utility.Response(c, http.StatusBadRequest, "Bad Request", nil)
		return
	}
	loginRequest.Password = utility.Encrypt(loginRequest.Password)
	ok, id := model.ValidUser(loginRequest.Email, loginRequest.Password)
	if ok {
		token := utility.GenereateToken(id)
		c.SetCookie("token", token, 3600, "/", config.Config.Server.Domain, false, false)
		log.Println("Login success")
		utility.Response(c, http.StatusOK, "Login success", gin.H{"token": token})
	} else {
		log.Println("Login failed")
		utility.Response(c, http.StatusBadRequest, "Login failed", nil)
	}
}

func CheckAdmin(c *gin.Context) {
	// ! this function must be called after checkadmin middleware
	utility.Response(c, http.StatusOK, "Check admin success", nil)
}

func GetUserCount(c *gin.Context) {
	count := model.GetUserCount()
	utility.Response(c, http.StatusOK, "success", gin.H{"count": count})
}

func Register(c *gin.Context) {
	registerRequest := &types.RegisterRequest{}
	if err := c.ShouldBindJSON(registerRequest); err != nil {
		log.Println("Register error: ", err)
		utility.Response(c, http.StatusBadRequest, "Bad Request", nil)
		return
	}
	registerRequest.Password = utility.Encrypt(registerRequest.Password)
	user := model.User{
		Email:    registerRequest.Email,
		Password: registerRequest.Password,
		Name:     registerRequest.Name,
		Profile:  model.Profile{},
	}
	if err := model.AddUser(&user); err != nil {
		log.Println("Register error: ", err)
		if strings.Contains(err.Error(), "unique constraint") {
			utility.Response(c, http.StatusBadRequest, "User already exists", nil)
		} else {
			utility.Response(c, http.StatusInternalServerError, "Interval Server Error", nil)
		}
		return
	}
	utility.Response(c, http.StatusOK, "success", nil)
}

func GetUserInfo(c *gin.Context) {
	id := c.GetUint("id")
	user, err := model.GetUserByID(id)
	if err != nil {
		log.Println("Get user info error: ", err)
		utility.Response(c, http.StatusInternalServerError, "Interval Server Error", nil)
		return
	}

	var tags []types.Tag
	for _, tag := range user.Profile.Tags {
		tags = append(tags, types.Tag{Name: tag.Name})
	}
	apiUser := &types.APIUser{
		Name:  user.Name,
		Email: user.Email,
		Tags:  tags,
		Level: user.Profile.Level,
	}
	utility.Response(c, http.StatusOK, "success", apiUser)
}

func GetTags(c *gin.Context) {
	tags := model.GetAllTags()
	var apiTags []types.Tag
	for _, tag := range tags {
		apiTags = append(apiTags, types.Tag{Name: tag.Name})
	}
	utility.Response(c, http.StatusOK, "success", apiTags)
}

func UpdateUserLevel(c *gin.Context) {
	updateUserLevelRequest := &types.UpdateUserLevelRequest{}
	if err := c.ShouldBindJSON(updateUserLevelRequest); err != nil {
		log.Println("Update user level error: ", err)
		utility.Response(c, http.StatusBadRequest, "Bad Request", nil)
		return
	}
	id := c.GetUint("id")
	if err := model.UpdateUserLevel(id, updateUserLevelRequest.Level); err != nil {
		log.Println("Update user level error: ", err)
		utility.Response(c, http.StatusInternalServerError, "Interval Server Error", nil)
		return
	}
	utility.Response(c, http.StatusOK, "success", nil)
}

func UpdateUserTags(c *gin.Context) {
	updateUserTagsRequest := &types.UpdateUserTagsRequest{}
	if err := c.ShouldBindJSON(updateUserTagsRequest); err != nil {
		log.Println("Update user tags error: ", err)
		utility.Response(c, http.StatusBadRequest, "Bad Request", nil)
		return
	}
	id := c.GetUint("id")
	if err := model.UpdateUserTags(id, updateUserTagsRequest.Tags); err != nil {
		log.Println("Update user tags error: ", err)
		utility.Response(c, http.StatusInternalServerError, "Interval Server Error", nil)
		return
	}
	utility.Response(c, http.StatusOK, "success", nil)
}
