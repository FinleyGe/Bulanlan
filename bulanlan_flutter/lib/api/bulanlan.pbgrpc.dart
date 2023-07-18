///
//  Generated code. Do not modify.
//  source: bulanlan.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'bulanlan.pb.dart' as $0;
export 'bulanlan.pb.dart';

class UserServiceClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginResponse>(
      '/bulanlan.UserService/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginResponse.fromBuffer(value));
  static final _$register = $grpc.ClientMethod<$0.RegisterRequest, $0.Response>(
      '/bulanlan.UserService/Register',
      ($0.RegisterRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$updateUser = $grpc.ClientMethod<$0.UserInfo, $0.Response>(
      '/bulanlan.UserService/UpdateUser',
      ($0.UserInfo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$getBooks =
      $grpc.ClientMethod<$0.GetBooksRequest, $0.GetBooksResponse>(
          '/bulanlan.UserService/GetBooks',
          ($0.GetBooksRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetBooksResponse.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.LoginResponse> login($0.LoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> register($0.RegisterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$register, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> updateUser($0.UserInfo request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetBooksResponse> getBooks($0.GetBooksRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBooks, request, options: options);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'bulanlan.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RegisterRequest, $0.Response>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserInfo, $0.Response>(
        'UpdateUser',
        updateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserInfo.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBooksRequest, $0.GetBooksResponse>(
        'GetBooks',
        getBooks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetBooksRequest.fromBuffer(value),
        ($0.GetBooksResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.LoginResponse> login_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.Response> register_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RegisterRequest> request) async {
    return register(call, await request);
  }

  $async.Future<$0.Response> updateUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserInfo> request) async {
    return updateUser(call, await request);
  }

  $async.Future<$0.GetBooksResponse> getBooks_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetBooksRequest> request) async {
    return getBooks(call, await request);
  }

  $async.Future<$0.LoginResponse> login(
      $grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$0.Response> register(
      $grpc.ServiceCall call, $0.RegisterRequest request);
  $async.Future<$0.Response> updateUser(
      $grpc.ServiceCall call, $0.UserInfo request);
  $async.Future<$0.GetBooksResponse> getBooks(
      $grpc.ServiceCall call, $0.GetBooksRequest request);
}
