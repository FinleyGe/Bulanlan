package utility

import (
	"crypto/sha256"
	"encoding/hex"
)

func Encrypt(str string) string {
	hash := sha256.Sum256([]byte(str))
	hashString := hex.EncodeToString(hash[:])
	return hashString
}
