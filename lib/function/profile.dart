import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // 创建一个全局Key，用于后续的表单验证
  final _formKey = GlobalKey<FormState>();

  // 创建文本编辑控制器，用于获取和设置文本字段的值
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _bioController = TextEditingController();
  final _genderController = TextEditingController();
  final _ageController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _educationController = TextEditingController();

  @override
  void dispose() {
    // 清理控制器，防止内存泄漏
    _nameController.dispose();
    _emailController.dispose();
    _bioController.dispose();
    _genderController.dispose();
    _ageController.dispose();
    _birthdayController.dispose();
    _educationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // 初始化时，可以加载用户当前的资料信息
    _nameController.text = '张三';
    _emailController.text = 'zhangsan@example.com';
    _bioController.text = '我是张三，一个热爱编程的人。';
    _genderController.text = '男';
    _ageController.text = '25';
    _birthdayController.text = '1998-01-01';
    _educationController.text = '本科';
  }

  // 保存按钮的点击事件
  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // 如果表单验证通过，保存资料信息
      // 这里可以发送请求到服务器或者更新本地状态
      print('Name: ${_nameController.text}');
      print('Email: ${_emailController.text}');
      print('Bio: ${_bioController.text}');
      print('Gender: ${_genderController.text}');
      print('Age: ${_ageController.text}');
      print('Birthday: ${_birthdayController.text}');
      print('Education: ${_educationController.text}');

      // 提示用户资料已保存
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('个人资料已保存')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人资料'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: '姓名'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入姓名';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _genderController,
                decoration: InputDecoration(labelText: '性别'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入性别';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: '年龄'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入年龄';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _birthdayController,
                decoration: InputDecoration(labelText: '生日'),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入生日';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _educationController,
                decoration: InputDecoration(labelText: '学历'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入学历';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: '邮箱'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入邮箱';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _bioController,
                decoration: InputDecoration(labelText: '个人简介'),
                maxLines: 3,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入个人简介';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveProfile,
                child: Text('保存'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
