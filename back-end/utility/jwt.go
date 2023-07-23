package utility

import (
	"bulanlan/config"
	"time"

	"github.com/golang-jwt/jwt"
)

type Claims struct {
	ID uint
	jwt.StandardClaims
}

func GenereateToken(ID uint) string {
	claims := Claims{
		ID: ID,
		StandardClaims: jwt.StandardClaims{
			ExpiresAt: time.Now().Add(time.Hour * 1).Unix(),
			Issuer:    "Bulanlan",
		},
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	tokenString, _ := token.SignedString([]byte(config.Config.Server.Secret))
	return tokenString
}

func ParseToken(token string) uint {
	claims := &Claims{}
	jwt.ParseWithClaims(token, claims, func(token *jwt.Token) (interface{}, error) {
		return []byte(config.Config.Server.Secret), nil
	})
	return claims.ID
}
