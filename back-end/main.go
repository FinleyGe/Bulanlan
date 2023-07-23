package main

import (
	_ "bulanlan/db"
	_ "bulanlan/db/model"
	"bulanlan/server"
)

func main() {
	go server.RunGRPCServer()
	server.RunRestfulServer()
}
