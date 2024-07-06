import 'package:flutter/material.dart';
import 'package:univercitys/screens/home_page.dart'; 
import 'package:univercitys/screens/education_page.dart'; 
import 'package:univercitys/screens/career_page.dart'; 
import 'package:univercitys/screens/finance_page.dart'; 
import 'package:univercitys/screens/personal_page.dart'; 

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectedIndex = 0;
  final List<Widget> _loggedInPages = [
    EducationPage(),
    CareerPage(),
    FinancePage(),
    PersonalPage(),
  ];
  bool _isLoggedIn = false;

  void _onLoginSuccess() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (!_isLoggedIn) {
      body = HomePage(onLoginSuccess: _onLoginSuccess);
    } else {
      body = Scaffold(
        appBar: AppBar(
          title: Text('大学生未来规划平台',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        body: _loggedInPages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.school), label: '教育'),
            BottomNavigationBarItem(icon: Icon(Icons.business), label: '职业'),
            BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: '财务'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '个人'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red, // 设置选中字体颜色为红色
          unselectedItemColor: Colors.black, // 设置未选中字体颜色为黑色
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      );
    }
    return body;
  }
}
