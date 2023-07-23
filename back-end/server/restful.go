package server

import (
	"bulanlan/RESTfulAPI"
	. "bulanlan/config"
	"context"
	"log"
	"net/http"
	"os"
	"os/signal"
	"strconv"
	"syscall"
	"time"
)

func RunRestfulServer() {
	var server *http.Server
	var port string = ":" + strconv.Itoa(Config.Server.RESTfulPort)

	log.Println("Running Server at", port)
	server = &http.Server{
		Addr:    port,
		Handler: restfulAPI.Router,
	}

	go func() {
		if err := server.ListenAndServe(); err != nil && err != http.ErrServerClosed {
			log.Fatalf("Listen: %s\n", err)
		}
	}()

	quit := make(chan os.Signal)
	signal.Notify(quit, os.Interrupt, syscall.SIGTERM)
	<-quit
	log.Println("Shutdown Server ...")

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	if err := server.Shutdown(ctx); err != nil {
		log.Fatal("Server Shutdown:", err)
	}
	log.Println("Server Exiting")

}
