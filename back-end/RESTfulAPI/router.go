package restfulAPI

import (
	"bulanlan/RESTfulAPI/controller"
	"bulanlan/RESTfulAPI/midware"
)

func init() {
	// without authorization
	Router.POST("/login", controller.Login)
	Router.POST("/register", controller.Register)

	// with authorization
	Router.GET("/getuserinfo", midware.Auth, controller.GetUserInfo)
	Router.GET("/gettags", midware.Auth, controller.GetTags)
	Router.GET("/getrecommendbooks", midware.Auth, controller.GetRecommendBooks)
	Router.POST("/updateuserlevel", midware.Auth, controller.UpdateUserLevel)
	Router.POST("/updateusertags", midware.Auth, controller.UpdateUserTags)
	// with admin authorization
	Router.GET("/checkadmin", midware.AdminAuth, controller.CheckAdmin)
	Router.GET("/getbookcount", midware.AdminAuth, controller.GetBookCount)
	Router.GET("/getusercount", midware.AdminAuth, controller.GetUserCount)
	Router.GET("/getbooks", midware.AdminAuth, controller.GetBooks)
	Router.POST("/addbook", midware.AdminAuth, controller.AddBook)
	Router.POST("/uploadbooklist", midware.AdminAuth, controller.UploadBookList)
}
