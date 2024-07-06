import 'package:flutter/material.dart';

class SecurityPage extends StatefulWidget {
  @override
  _SecurityPageState createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  // 创建一个全局Key，用于后续的表单验证
  final _formKey = GlobalKey<FormState>();

  // 创建文本编辑控制器，用于获取和设置文本字段的值
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // 清理控制器，防止内存泄漏
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // 更改密码按钮的点击事件
  void _changePassword() {
    if (_formKey.currentState!.validate()) {
      // 如果表单验证通过，执行密码更改逻辑
      // 这里可以发送请求到服务器或者更新本地状态
      print('Old Password: ${_oldPasswordController.text}');
      print('New Password: ${_newPasswordController.text}');
      print('Confirm Password: ${_confirmPasswordController.text}');

      // 提示用户密码已更改
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('密码已更改')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('账户安全'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _oldPasswordController,
                decoration: InputDecoration(labelText: '旧密码'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入旧密码';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _newPasswordController,
                decoration: InputDecoration(labelText: '新密码'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入新密码';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(labelText: '确认新密码'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请再次输入新密码';
                  }
                  if (value != _newPasswordController.text) {
                    return '两次输入的密码不一致';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _changePassword,
                child: Text('更改密码'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
