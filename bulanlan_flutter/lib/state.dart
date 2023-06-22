import "package:flutter/foundation.dart";

class ViewChangeNotifier extends ChangeNotifier {
  int _nowIndex = 0;
  String _title = "测试";
  int get nowIndex => _nowIndex;

  void changeIndex(int index) {
    _nowIndex = index;
    notifyListeners();
  }

  String get title => _title;

  set title(String title) {
    _title = title;
    notifyListeners();
  }
}

class UserChangeNotifier extends ChangeNotifier {
  String _name = "未登录";
  String _email = "未登录";

  String get name => _name;

  String get email => _email;

  set name(String name) {
    _name = name;
    notifyListeners();
  }

  set email(String email) {
    _email = email;
    notifyListeners();
  }
}
