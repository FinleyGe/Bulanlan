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
  static final _$updateUserLevel =
      $grpc.ClientMethod<$0.UpdateUserLevelRequest, $0.Response>(
          '/bulanlan.UserService/UpdateUserLevel',
          ($0.UpdateUserLevelRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$updateUserTags =
      $grpc.ClientMethod<$0.UpdateUserTagsRequest, $0.Response>(
          '/bulanlan.UserService/UpdateUserTags',
          ($0.UpdateUserTagsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$getBooks = $grpc.ClientMethod<$0.Request, $0.GetBooksResponse>(
      '/bulanlan.UserService/GetBooks',
      ($0.Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetBooksResponse.fromBuffer(value));
  static final _$getTags = $grpc.ClientMethod<$0.Request, $0.GetTagsResponse>(
      '/bulanlan.UserService/GetTags',
      ($0.Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetTagsResponse.fromBuffer(value));
  static final _$getUserInfo =
      $grpc.ClientMethod<$0.Request, $0.GetUserInfoResponse>(
          '/bulanlan.UserService/GetUserInfo',
          ($0.Request value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetUserInfoResponse.fromBuffer(value));

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

  $grpc.ResponseFuture<$0.Response> updateUserLevel(
      $0.UpdateUserLevelRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUserLevel, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> updateUserTags(
      $0.UpdateUserTagsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUserTags, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetBooksResponse> getBooks($0.Request request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBooks, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetTagsResponse> getTags($0.Request request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTags, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetUserInfoResponse> getUserInfo($0.Request request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserInfo, request, options: options);
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
    $addMethod($grpc.ServiceMethod<$0.UpdateUserLevelRequest, $0.Response>(
        'UpdateUserLevel',
        updateUserLevel_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateUserLevelRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateUserTagsRequest, $0.Response>(
        'UpdateUserTags',
        updateUserTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateUserTagsRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Request, $0.GetBooksResponse>(
        'GetBooks',
        getBooks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Request.fromBuffer(value),
        ($0.GetBooksResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Request, $0.GetTagsResponse>(
        'GetTags',
        getTags_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Request.fromBuffer(value),
        ($0.GetTagsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Request, $0.GetUserInfoResponse>(
        'GetUserInfo',
        getUserInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Request.fromBuffer(value),
        ($0.GetUserInfoResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.LoginResponse> login_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.Response> register_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RegisterRequest> request) async {
    return register(call, await request);
  }

  $async.Future<$0.Response> updateUserLevel_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdateUserLevelRequest> request) async {
    return updateUserLevel(call, await request);
  }

  $async.Future<$0.Response> updateUserTags_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdateUserTagsRequest> request) async {
    return updateUserTags(call, await request);
  }

  $async.Future<$0.GetBooksResponse> getBooks_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Request> request) async {
    return getBooks(call, await request);
  }

  $async.Future<$0.GetTagsResponse> getTags_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Request> request) async {
    return getTags(call, await request);
  }

  $async.Future<$0.GetUserInfoResponse> getUserInfo_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Request> request) async {
    return getUserInfo(call, await request);
  }

  $async.Future<$0.LoginResponse> login(
      $grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$0.Response> register(
      $grpc.ServiceCall call, $0.RegisterRequest request);
  $async.Future<$0.Response> updateUserLevel(
      $grpc.ServiceCall call, $0.UpdateUserLevelRequest request);
  $async.Future<$0.Response> updateUserTags(
      $grpc.ServiceCall call, $0.UpdateUserTagsRequest request);
  $async.Future<$0.GetBooksResponse> getBooks(
      $grpc.ServiceCall call, $0.Request request);
  $async.Future<$0.GetTagsResponse> getTags(
      $grpc.ServiceCall call, $0.Request request);
  $async.Future<$0.GetUserInfoResponse> getUserInfo(
      $grpc.ServiceCall call, $0.Request request);
}
