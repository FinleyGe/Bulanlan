package midware

import (
	. "bulanlan/config"
	"log"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

func Cors() gin.HandlerFunc {
	config := cors.DefaultConfig()
	config.AllowOrigins = Config.Server.AllowOrigins
	log.Println("AllowOrigins: ", config.AllowOrigins)
	config.AllowMethods = []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"}
	config.AllowHeaders = []string{"Origin", "Content-Length", "Content-Type", "Authorization", "Cookie", "X-CSRF-Token", "X-Requested-With"}
	config.AllowCredentials = true
	return cors.New(config)
}
