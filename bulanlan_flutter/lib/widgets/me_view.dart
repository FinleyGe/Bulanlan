import 'package:flutter/material.dart';
import 'package:bulanlan_flutter/widgets/user_info.dart';

class MeView extends StatefulWidget {
  const MeView({Key? key}) : super(key: key);

  @override
  State<MeView> createState() => MeViewState();
}

class MeViewState extends State<MeView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UserInfo(),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text("设置"),
          ),
        ],
      ),
    );
  }
}
