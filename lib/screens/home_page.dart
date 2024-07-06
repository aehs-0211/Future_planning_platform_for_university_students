import 'package:flutter/material.dart';
import 'package:univercitys/screens/login_screen.dart';
import 'package:univercitys/screens/register_screen.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onLoginSuccess;

  HomePage({required this.onLoginSuccess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 欢迎文本
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome to\n',
                      style: TextStyle(fontSize: 26.0, color: Colors.blueGrey),
                    ),
                    TextSpan(
                      text: '大学生未来规划平台',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32.0),
            // // 装饰性图标或图像（根据需要添加）
            // Image.asset('assets/astral.jpg', height: 150.0),
            Icon(Icons.school, size: 100.0, color: Theme.of(context).primaryColor),
            SizedBox(height: 32.0),
            // 登录按钮
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage(onLoginSuccess: onLoginSuccess)),
                  );
                },
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  elevation: WidgetStateProperty.all(8.0),
                  minimumSize: WidgetStateProperty.all(Size(double.infinity, 50)),
                ),
                child: Text(
                  '登录',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            // 注册按钮
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  elevation: WidgetStateProperty.all(8.0),
                  minimumSize: WidgetStateProperty.all(Size(double.infinity, 50)),
                ),
                child: Text(
                  '注册',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
