import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:univercitys/information/scaffold_route.dart'; // 导入ScaffoldRoute

class NotificationSettingsPage extends StatefulWidget {
  @override
  _NotificationSettingsPageState createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool _enableNotifications = true;

  @override
  void initState() {
    super.initState();
    _loadNotificationsSetting();
  }

  Future<void> _loadNotificationsSetting() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _enableNotifications = prefs.getBool('enableNotifications') ?? true;
    });
  }

  Future<void> _saveNotificationsSetting(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('enableNotifications', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('通知设置'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SwitchListTile(
              title: Text('接收通知'),
              value: _enableNotifications,
              onChanged: (bool value) {
                setState(() {
                  _enableNotifications = value;
                });
                _saveNotificationsSetting(value);
              },
            ),
            // 可以根据需要添加更多设置选项
          ],
        ),
      ),
    );
  }
}

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('帮助与反馈'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: ' ',
                hintText: '请输入您的反馈意见...',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // 处理反馈提交逻辑
                // 可以使用SnackBar显示提示信息
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('感谢您的反馈！')),
                );
              },
              child: Text('提交反馈'),
            ),
          ],
        ),
      ),
    );
  }
}

void signOut(BuildContext context) async {
  // 清除所有SharedPreferences中的数据
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();

  // 导航回ScaffoldRoute的初始页面，通常是登录页面
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ScaffoldRoute()));
}
