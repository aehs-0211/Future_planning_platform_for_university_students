import 'package:flutter/material.dart';
import 'package:univercitys/information/user_manager.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: '账号'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: '密码'),
            ),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: '确认密码'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                register(context);
              },
              child: Text('注册'),
            ),
          ],
        ),
      ),
    );
  }

  void register(BuildContext context) {
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;

    if (password == confirmPassword) {
      // 密码匹配，检查密码复杂性
      if (isPasswordComplexEnough(password)) {
        final String username = _usernameController.text;
        UserManager.registerUser(username, password);
        _showSnackBar(context, '注册成功');
        Navigator.pop(context); // 返回登录页面
      } else {
        // 密码不满足复杂性要求
        _showSnackBar(context, '注册失败，密码必须包含字母和数字，且长度不小于6');
      }
    } else {
      // 密码不匹配，注册失败
      _showSnackBar(context, '注册失败，密码需一致');
    }
  }

  bool isPasswordComplexEnough(String password) {
    // 正则表达式用于匹配至少一个字母和一个数字，且长度不小于6
    final regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$');
    return regex.hasMatch(password);
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
