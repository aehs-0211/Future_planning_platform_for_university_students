import 'package:flutter/material.dart';
import 'package:univercitys/screens/register_screen.dart';
import 'package:univercitys/information/user_manager.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onLoginSuccess;

  LoginPage({required this.onLoginSuccess});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: '账号'),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: '密码'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;
                if (UserManager.loginUser(username, password)) {
                  // 登录成功
                  widget.onLoginSuccess();
                  Navigator.pop(context);
                } else {
                  // 登录失败
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('用户名或密码错误'),
                    ),
                  );
                }
              },
              child: Text('登录'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Text('没有账号？注册一个'),
            ),
          ],
        ),
      ),
    );
  }
}