all:
	make go
	make dart
go:
	protoc --go_out=../back-end --go_opt=paths=import \
		--go-grpc_out=../back-end --go-grpc_opt=paths=import \
		bulanlan.proto

dart:
	protoc --dart_out=grpc:../bulanlan_flutter/lib/api/ \
		bulanlan.proto
