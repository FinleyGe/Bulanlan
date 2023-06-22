import 'package:bulanlan_flutter/state.dart';
import 'package:bulanlan_flutter/widgets/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              child: Text(context.read<UserChangeNotifier>().name[0]),
              radius: 30,
            ),
            Text(context.read<UserChangeNotifier>().name,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center),
            IconButton(
              icon: const Icon(Icons.arrow_right_rounded),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: const Text("登录"),
                      ),
                      body: Container(
                        margin: const EdgeInsets.all(10),
                        child: Login(),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
