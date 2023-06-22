import 'package:bulanlan_flutter/api/bulanlan.pbgrpc.dart';
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
    'localhost',
    port: 50051,
    options: ChannelOptions(credentials: creds),
  );
}

Future<response> login(LoginRequest r) async {
  var stub = UserServiceClient(await client);
  var res = await stub.login(r);
  return res;
}
