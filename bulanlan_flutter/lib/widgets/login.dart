import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  LoginViewType _viewType = LoginViewType.login;
  @override
  Widget build(BuildContext context) {
    if (_viewType == LoginViewType.login) {
      return Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: "邮箱",
            ),
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "密码",
            ),
          ),
          ButtonBar(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _viewType = LoginViewType.register;
                  });
                },
                child: const Text("我还没有账号"),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("登录"),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("忘记密码"),
              ),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: "邮箱",
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "密码",
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "确认密码",
            ),
          ),
          ButtonBar(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _viewType = LoginViewType.login;
                  });
                },
                child: const Text("我有账号"),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("注册"),
              ),
            ],
          ),
        ],
      );
    }
  }
}

enum LoginViewType {
  login,
  register,
}
