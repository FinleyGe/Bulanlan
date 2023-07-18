///
//  Generated code. Do not modify.
//  source: bulanlan.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use userDescriptor instead')
const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'is_tested', '3': 4, '4': 1, '5': 8, '10': 'isTested'},
    const {'1': 'level', '3': 5, '4': 1, '5': 9, '10': 'level'},
    const {'1': 'tags', '3': 6, '4': 3, '5': 11, '6': '.bulanlan.Tag', '10': 'tags'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode('CgRVc2VyEhIKBG5hbWUYASABKAlSBG5hbWUSFAoFZW1haWwYAiABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAMgASgJUghwYXNzd29yZBIbCglpc190ZXN0ZWQYBCABKAhSCGlzVGVzdGVkEhQKBWxldmVsGAUgASgJUgVsZXZlbBIhCgR0YWdzGAYgAygLMg0uYnVsYW5sYW4uVGFnUgR0YWdz');
@$core.Deprecated('Use bookDescriptor instead')
const Book$json = const {
  '1': 'Book',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
    const {'1': 'level', '3': 3, '4': 1, '5': 9, '10': 'level'},
    const {'1': 'tags', '3': 4, '4': 3, '5': 11, '6': '.bulanlan.Tag', '10': 'tags'},
  ],
};

/// Descriptor for `Book`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bookDescriptor = $convert.base64Decode('CgRCb29rEhIKBG5hbWUYASABKAlSBG5hbWUSEAoDdXJsGAIgASgJUgN1cmwSFAoFbGV2ZWwYAyABKAlSBWxldmVsEiEKBHRhZ3MYBCADKAsyDS5idWxhbmxhbi5UYWdSBHRhZ3M=');
@$core.Deprecated('Use tagDescriptor instead')
const Tag$json = const {
  '1': 'Tag',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Tag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tagDescriptor = $convert.base64Decode('CgNUYWcSEgoEbmFtZRgBIAEoCVIEbmFtZQ==');
@$core.Deprecated('Use responseDescriptor instead')
const Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 5, '10': 'code'},
    const {'1': 'msg', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'msg', '17': true},
  ],
  '8': const [
    const {'1': '_msg'},
  ],
};

/// Descriptor for `Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDescriptor = $convert.base64Decode('CghSZXNwb25zZRISCgRjb2RlGAEgASgFUgRjb2RlEhUKA21zZxgCIAEoCUgAUgNtc2eIAQFCBgoEX21zZw==');
@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = const {
  '1': 'LoginRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode('CgxMb2dpblJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = const {
  '1': 'RegisterRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode('Cg9SZWdpc3RlclJlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRIUCgVlbWFpbBgCIAEoCVIFZW1haWwSGgoIcGFzc3dvcmQYAyABKAlSCHBhc3N3b3Jk');
@$core.Deprecated('Use userInfoDescriptor instead')
const UserInfo$json = const {
  '1': 'UserInfo',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'level', '3': 3, '4': 1, '5': 9, '10': 'level'},
    const {'1': 'tags', '3': 4, '4': 3, '5': 11, '6': '.bulanlan.Tag', '10': 'tags'},
  ],
};

/// Descriptor for `UserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoDescriptor = $convert.base64Decode('CghVc2VySW5mbxISCgRuYW1lGAEgASgJUgRuYW1lEhQKBWVtYWlsGAIgASgJUgVlbWFpbBIUCgVsZXZlbBgDIAEoCVIFbGV2ZWwSIQoEdGFncxgEIAMoCzINLmJ1bGFubGFuLlRhZ1IEdGFncw==');
@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse$json = const {
  '1': 'LoginResponse',
  '2': const [
    const {'1': 'response', '3': 1, '4': 1, '5': 11, '6': '.bulanlan.Response', '10': 'response'},
    const {'1': 'user_info', '3': 2, '4': 1, '5': 11, '6': '.bulanlan.UserInfo', '10': 'userInfo'},
  ],
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode('Cg1Mb2dpblJlc3BvbnNlEi4KCHJlc3BvbnNlGAEgASgLMhIuYnVsYW5sYW4uUmVzcG9uc2VSCHJlc3BvbnNlEi8KCXVzZXJfaW5mbxgCIAEoCzISLmJ1bGFubGFuLlVzZXJJbmZvUgh1c2VySW5mbw==');
@$core.Deprecated('Use getBooksRequestDescriptor instead')
const GetBooksRequest$json = const {
  '1': 'GetBooksRequest',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.bulanlan.User', '10': 'user'},
  ],
};

/// Descriptor for `GetBooksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBooksRequestDescriptor = $convert.base64Decode('Cg9HZXRCb29rc1JlcXVlc3QSIgoEdXNlchgBIAEoCzIOLmJ1bGFubGFuLlVzZXJSBHVzZXI=');
@$core.Deprecated('Use getBooksResponseDescriptor instead')
const GetBooksResponse$json = const {
  '1': 'GetBooksResponse',
  '2': const [
    const {'1': 'response', '3': 1, '4': 1, '5': 11, '6': '.bulanlan.Response', '10': 'response'},
    const {'1': 'books', '3': 2, '4': 3, '5': 11, '6': '.bulanlan.Book', '10': 'books'},
  ],
};

/// Descriptor for `GetBooksResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBooksResponseDescriptor = $convert.base64Decode('ChBHZXRCb29rc1Jlc3BvbnNlEi4KCHJlc3BvbnNlGAEgASgLMhIuYnVsYW5sYW4uUmVzcG9uc2VSCHJlc3BvbnNlEiQKBWJvb2tzGAIgAygLMg4uYnVsYW5sYW4uQm9va1IFYm9va3M=');
