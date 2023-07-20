import 'package:flutter/material.dart';
import 'package:bulanlan_flutter/widgets/user_info.dart';
import 'package:provider/provider.dart';

import '../state.dart';

class MeView extends StatefulWidget {
  const MeView({Key? key}) : super(key: key);

  @override
  State<MeView> createState() => MeViewState();
}

class MeViewState extends State<MeView> {
  void handelLevel() {
    if (Provider.of<UserChangeNotifier>(context, listen: false).token == "") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("请先登录"),
      ));
      return;
    }
    Navigator.of(context).pushNamed('/test');
  }

  void handelSelectTags() {
    if (Provider.of<UserChangeNotifier>(context, listen: false).token == "") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("请先登录"),
      ));
      return;
    }
    Navigator.of(context).pushNamed('/tags');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const UserInfo(),
          Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("我的等级: ", style: TextStyle(fontSize: 20)),
                  Text(
                    Provider.of<UserChangeNotifier>(context).level.toString() ==
                            ''
                        ? '未定级'
                        : Provider.of<UserChangeNotifier>(context)
                            .level
                            .toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const Text("我的兴趣标签: ", style: TextStyle(fontSize: 20)),
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.8),
                child:
                    // children: [
                    //   const Text("我的兴趣标签: ", style: TextStyle(fontSize: 20)),
                    Container(
                  child: Wrap(
                    children: Provider.of<UserChangeNotifier>(context)
                        .tags
                        .map((e) => Container(
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(e),
                            ))
                        .toList(),
                  ),
                ),
                // ],
              ),
            ],
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.done),
            title: const Text("能力定级"),
            onTap: handelLevel,
          ),
          ListTile(
            leading: const Icon(Icons.label),
            title: const Text("选择标签"),
            onTap: handelSelectTags,
          ),
        ],
      ),
    );
  }
}
