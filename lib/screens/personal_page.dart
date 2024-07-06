import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:univercitys/function/avatar.dart';
import 'package:univercitys/function/personal_function.dart';
import 'package:univercitys/function/profile.dart';
import 'package:univercitys/function/security.dart';

class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  XFile? _currentAvatar;

  @override
  void initState() {
    super.initState();
    // 初始化时，可以设置一个默认的头像
    _currentAvatar = null;
  }

  void _selectAvatar() async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => Avatar()));
    if (result != null) {
      setState(() {
        _currentAvatar = result as XFile?;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' '),
        leading: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: _selectAvatar,
              child: CircleAvatar(
                backgroundImage: _currentAvatar == null
                    ? AssetImage('assets/avatar.jpg') as ImageProvider
                    : FileImage(File(_currentAvatar!.path)),
                radius: 20.0,
              ),
            );
          },
        ),
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 72.0), // 调整这个值来适应你的布局
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '逃跑的太阳',
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text('个人资料'),
            subtitle: Text('查看和编辑你的个人资料'),
            onTap: () {
              // 跳转到个人资料页面
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('账户安全'),
            subtitle: Text('设置或更改你的密码'),
            onTap: () {
              // 跳转到账户安全页面
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecurityPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('通知设置'),
            subtitle: Text('管理你的应用通知'),
            onTap: () {
              // 跳转到通知设置页面
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationSettingsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('帮助与反馈'),
            subtitle: Text('获取帮助或提供反馈'),
            onTap: () {
              // 显示帮助与反馈页面或对话框
              Navigator.push(context, MaterialPageRoute(builder: (context) => HelpPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('退出登录'),
            subtitle: Text('退出当前账户'),
            onTap: () {
              // 调用sign_out.dart中的signOut函数
              signOut(context);
            },
          ),
        ],
      ),
    );
  }
}
