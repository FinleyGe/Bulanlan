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

class BookServiceClient extends $grpc.Client {
  static final _$getBooks = $grpc.ClientMethod<$0.User, $0.response>(
      '/bulanlan.BookService/GetBooks',
      ($0.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.response.fromBuffer(value));
  static final _$addBook = $grpc.ClientMethod<$0.Book, $0.response>(
      '/bulanlan.BookService/AddBook',
      ($0.Book value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.response.fromBuffer(value));
  static final _$deleteBook = $grpc.ClientMethod<$0.Book, $0.response>(
      '/bulanlan.BookService/DeleteBook',
      ($0.Book value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.response.fromBuffer(value));
  static final _$updateBook = $grpc.ClientMethod<$0.Book, $0.response>(
      '/bulanlan.BookService/UpdateBook',
      ($0.Book value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.response.fromBuffer(value));

  BookServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.response> getBooks($0.User request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBooks, request, options: options);
  }

  $grpc.ResponseFuture<$0.response> addBook($0.Book request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addBook, request, options: options);
  }

  $grpc.ResponseFuture<$0.response> deleteBook($0.Book request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteBook, request, options: options);
  }

  $grpc.ResponseFuture<$0.response> updateBook($0.Book request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateBook, request, options: options);
  }
}

abstract class BookServiceBase extends $grpc.Service {
  $core.String get $name => 'bulanlan.BookService';

  BookServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.User, $0.response>(
        'GetBooks',
        getBooks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.User.fromBuffer(value),
        ($0.response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Book, $0.response>(
        'AddBook',
        addBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Book.fromBuffer(value),
        ($0.response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Book, $0.response>(
        'DeleteBook',
        deleteBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Book.fromBuffer(value),
        ($0.response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Book, $0.response>(
        'UpdateBook',
        updateBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Book.fromBuffer(value),
        ($0.response value) => value.writeToBuffer()));
  }

  $async.Future<$0.response> getBooks_Pre(
      $grpc.ServiceCall call, $async.Future<$0.User> request) async {
    return getBooks(call, await request);
  }

  $async.Future<$0.response> addBook_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Book> request) async {
    return addBook(call, await request);
  }

  $async.Future<$0.response> deleteBook_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Book> request) async {
    return deleteBook(call, await request);
  }

  $async.Future<$0.response> updateBook_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Book> request) async {
    return updateBook(call, await request);
  }

  $async.Future<$0.response> getBooks($grpc.ServiceCall call, $0.User request);
  $async.Future<$0.response> addBook($grpc.ServiceCall call, $0.Book request);
  $async.Future<$0.response> deleteBook(
      $grpc.ServiceCall call, $0.Book request);
  $async.Future<$0.response> updateBook(
      $grpc.ServiceCall call, $0.Book request);
}

class UserServiceClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.response>(
      '/bulanlan.UserService/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.response.fromBuffer(value));
  static final _$register = $grpc.ClientMethod<$0.RegisterRequest, $0.response>(
      '/bulanlan.UserService/Register',
      ($0.RegisterRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.response.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.response> login($0.LoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$0.response> register($0.RegisterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$register, request, options: options);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'bulanlan.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.response>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RegisterRequest, $0.response>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterRequest.fromBuffer(value),
        ($0.response value) => value.writeToBuffer()));
  }

  $async.Future<$0.response> login_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.response> register_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RegisterRequest> request) async {
    return register(call, await request);
  }

  $async.Future<$0.response> login(
      $grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$0.response> register(
      $grpc.ServiceCall call, $0.RegisterRequest request);
}

class TagServiceClient extends $grpc.Client {
  static final _$addTag = $grpc.ClientMethod<$0.Tag, $0.response>(
      '/bulanlan.TagService/AddTag',
      ($0.Tag value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.response.fromBuffer(value));
  static final _$deleteTag = $grpc.ClientMethod<$0.Tag, $0.response>(
      '/bulanlan.TagService/DeleteTag',
      ($0.Tag value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.response.fromBuffer(value));

  TagServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.response> addTag($0.Tag request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addTag, request, options: options);
  }

  $grpc.ResponseFuture<$0.response> deleteTag($0.Tag request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteTag, request, options: options);
  }
}

abstract class TagServiceBase extends $grpc.Service {
  $core.String get $name => 'bulanlan.TagService';

  TagServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Tag, $0.response>(
        'AddTag',
        addTag_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Tag.fromBuffer(value),
        ($0.response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Tag, $0.response>(
        'DeleteTag',
        deleteTag_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Tag.fromBuffer(value),
        ($0.response value) => value.writeToBuffer()));
  }

  $async.Future<$0.response> addTag_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Tag> request) async {
    return addTag(call, await request);
  }

  $async.Future<$0.response> deleteTag_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Tag> request) async {
    return deleteTag(call, await request);
  }

  $async.Future<$0.response> addTag($grpc.ServiceCall call, $0.Tag request);
  $async.Future<$0.response> deleteTag($grpc.ServiceCall call, $0.Tag request);
}
