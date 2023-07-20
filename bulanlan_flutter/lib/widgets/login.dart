import 'package:bulanlan_flutter/state.dart';
import 'package:flutter/material.dart';
import 'package:bulanlan_flutter/api/api.dart' as api;
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({Key? key, required this.callback}) : super(key: key);

  Function callback;
  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  LoginViewType _viewType = LoginViewType.login;

  void register() {
    api.register(email, password, name).then((res) => {
          if (res.code == 200)
            {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("注册成功"),
              )),
              setState(() {
                _viewType = LoginViewType.login;
              })
            }
          else
            {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("注册失败"),
              ))
            }
        });
  }

  String email = "";
  String password = "";
  String confirmPassword = "";
  String name = "";

  void handleLogin() {
    api
        .login(email, password)
        .then((res) => {
              if (res.response.code == 200)
                {
                  Provider.of<UserChangeNotifier>(context, listen: false)
                      .token = res.token,
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("登录成功"),
                  )),
                  Navigator.of(context).pop(),
                  widget.callback(),
                }
              else
                {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("登录失败, 账号或密码错误"),
                  )),
                }
            })
        .catchError((err) => {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("登录失败$err"),
              ))
            });
  }

  @override
  Widget build(BuildContext context) {
    if (_viewType == LoginViewType.login) {
      return Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: "邮箱",
            ),
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "密码",
            ),
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
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
                onPressed: () {
                  handleLogin();
                },
                child: const Text("登录"),
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
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "用户名",
            ),
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "密码",
            ),
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "确认密码",
            ),
            onChanged: (value) {
              setState(() {
                confirmPassword = value;
              });
            },
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
                onPressed: () {
                  register();
                },
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
