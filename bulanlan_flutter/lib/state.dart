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
  String _token = "";
  String _name = "未登录";
  String _level = "";
  List<String> _tags = [];
  String get token => _token;
  String get name => _name;
  String get level => _level;
  List<String> get tags => _tags;

  set token(String token) {
    _token = token;
    notifyListeners();
  }

  set name(String name) {
    _name = name;
    notifyListeners();
  }

  set level(String level) {
    _level = level;
    notifyListeners();
  }

  set tags(List<String> tags) {
    _tags = tags;
    notifyListeners();
  }
}
