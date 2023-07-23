package server

import (
	"flag"
	"fmt"
	"log"
	"net"
	"os"
	"os/signal"

	api "bulanlan/api"
	"bulanlan/config"
	c "bulanlan/gRPCAPI"

	grpc_middleware "github.com/grpc-ecosystem/go-grpc-middleware"
	grpc_recovery "github.com/grpc-ecosystem/go-grpc-middleware/recovery"
	grpc_ctxtags "github.com/grpc-ecosystem/go-grpc-middleware/tags"
	"google.golang.org/grpc"
	"google.golang.org/grpc/channelz/service"
	"google.golang.org/grpc/credentials"
	"google.golang.org/grpc/reflection"
)

var (
	port = flag.Int("port", config.Config.Server.GRPCPort, "The server port")
)

func RunGRPCServer() {
	creds, err := credentials.NewServerTLSFromFile("./cert/server.pem", "./cert/server.key")
	if err != nil {
		log.Fatalf("could not load TLS keys: %s", err)
	}

	flag.Parse()
	lis, err := net.Listen("tcp", fmt.Sprintf("0.0.0.0:%d", *port))
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}
	defer lis.Close()
	s := grpc.NewServer(
		grpc.Creds(creds),
		grpc.UnaryInterceptor(grpc_middleware.ChainUnaryServer(
			grpc_recovery.UnaryServerInterceptor(),
			grpc_ctxtags.UnaryServerInterceptor(grpc_ctxtags.WithFieldExtractor(grpc_ctxtags.CodeGenRequestFieldExtractor)),
		)),
	)

	api.RegisterUserServiceServer(s, &c.UserSeviceServer{})
	reflection.Register(s)
	service.RegisterChannelzServiceToServer(s)

	log.Printf("gRPC server listening at %v", lis.Addr())
	go func() {
		if err := s.Serve(lis); err != nil {
			log.Fatalf("failed to serve: %v", err)
		}
	}()
	defer s.GracefulStop()

	ch := make(chan os.Signal, 1)
	signal.Notify(ch, os.Interrupt, os.Kill)
	<-ch
	log.Println("Stopping the server")
	s.Stop()
	lis.Close()
	log.Println("Server stopped")
}
