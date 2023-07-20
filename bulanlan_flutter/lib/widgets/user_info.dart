import 'package:bulanlan_flutter/state.dart';
import 'package:bulanlan_flutter/widgets/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bulanlan_flutter/api/api.dart' as api;

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  void flush() {
    api
        .getUserInfo(
            Provider.of<UserChangeNotifier>(context, listen: false).token)
        .then((res) {
      setState(() {
        Provider.of<UserChangeNotifier>(context, listen: false).name =
            res.userInfo.name;
        Provider.of<UserChangeNotifier>(context, listen: false).level =
            res.userInfo.level;
        List<String> tags = [];
        for (var tag in res.userInfo.tags) {
          tags.add(tag.name);
        }
        Provider.of<UserChangeNotifier>(context, listen: false).tags = tags;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 25,
              child: Text(
                Provider.of<UserChangeNotifier>(context).name[0],
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Text(Provider.of<UserChangeNotifier>(context).name,
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
                        child: Login(callback: flush),
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
