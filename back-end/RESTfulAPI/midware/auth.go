package midware

import (
	"bulanlan/db/model"
	"bulanlan/utility"
	"net/http"

	"github.com/gin-gonic/gin"
)

func AdminAuth(c *gin.Context) {
	cookie, err := c.Cookie("token")
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
		c.Abort()
		return
	} else {
		id := utility.ParseToken(cookie)
		if id == 0 {
			c.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
			c.Abort()
			return
		}
		res := model.IsAdmin(id)
		if res == false {
			c.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
			c.Abort()
			return
		} else {
			c.Next()
		}
	}
}

func Auth(c *gin.Context) {
	cookie, err := c.Cookie("token")
	id := utility.ParseToken(cookie)
	if err != nil || id == 0 {
		utility.Response(c, http.StatusUnauthorized, "Unauthorized", nil)
		c.Abort()
		return
	}
	c.Set("id", id)
	c.Next()
}
