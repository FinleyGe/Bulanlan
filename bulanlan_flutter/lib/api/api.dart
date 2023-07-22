import 'package:bulanlan_flutter/api/bulanlan.pbgrpc.dart' as pb;
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';

var client = initClient();

Future<ClientChannel> initClient() async {
  var cert = await rootBundle.load('assets/server.pem');
  var creds = ChannelCredentials.secure(
    certificates: cert.buffer.asUint8List(),
    onBadCertificate: (cert, host) => true,
  );
  return ClientChannel(
    '101.34.27.200',
    port: 50051,
    options: ChannelOptions(credentials: creds),
  );
}

Future<pb.LoginResponse> login(
  String email,
  String password,
) async {
  var stub = pb.UserServiceClient(await client);
  var res = await stub.login(pb.LoginRequest()
    ..email = email
    ..password = password);
  return res;
}

Future<pb.Response> register(
  String email,
  String password,
  String name,
) async {
  var stub = pb.UserServiceClient(await client);
  var res = await stub.register(pb.RegisterRequest()
    ..email = email
    ..password = password
    ..name = name);
  return res;
}

Future<pb.GetUserInfoResponse> getUserInfo(String token) async {
  var stub = pb.UserServiceClient(await client);
  var res = await stub.getUserInfo(pb.Request()..token = token);
  return res;
}

Future<pb.Response> updateLevel(String token, String level) async {
  var stub = pb.UserServiceClient(await client);
  var res = await stub.updateUserLevel(pb.UpdateUserLevelRequest()
    ..token = token
    ..level = level);
  return res;
}

Future<pb.Response> updateTags(String token, List<String> tags) async {
  var stub = pb.UserServiceClient(await client);
  List<pb.Tag> apiTags = [];
  for (var tag in tags) {
    apiTags.add(pb.Tag()..name = tag);
  }
  var res = await stub.updateUserTags(pb.UpdateUserTagsRequest()
    ..token = token
    ..tags.addAll(apiTags));
  return res;
}

Future<pb.GetBooksResponse> getBooks(String token) async {
  var stub = pb.UserServiceClient(await client);
  var res = await stub.getBooks(pb.Request()..token = token);
  return res;
}

Future<pb.GetTagsResponse> getTags(String token) async {
  var stub = pb.UserServiceClient(await client);
  var res = await stub.getTags(pb.Request()..token = token);
  return res;
}
