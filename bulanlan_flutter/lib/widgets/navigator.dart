import 'package:bulanlan_flutter/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyNavigator extends StatefulWidget {
  const MyNavigator({Key? key}) : super(key: key);

  @override
  State<MyNavigator> createState() => _MyNavigatorState();
}

class _MyNavigatorState extends State<MyNavigator> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: context.watch<ViewChangeNotifier>().nowIndex,
      items: const [
        BottomNavigationBarItem(label: "测试", icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: "推荐阅读", icon: Icon(Icons.book)),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "我",
        ),
      ],
      onTap: (index) {
        context.read<ViewChangeNotifier>().changeIndex(index);
        if (index == 0) {
          context.read<ViewChangeNotifier>().title = "测试";
        } else if (index == 1) {
          context.read<ViewChangeNotifier>().title = "推荐阅读";
        } else if (index == 2) {
          context.read<ViewChangeNotifier>().title = "我";
        }
      },
    );
  }
}
