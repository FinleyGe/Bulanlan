package restfulAPI

import (
	"bulanlan/RESTfulAPI/midware"

	"github.com/gin-gonic/gin"
)

var Router *gin.Engine

func init() {
	Router = gin.Default()
	Router.Use(midware.Cors())
}
