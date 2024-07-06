import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Avatar extends StatefulWidget {
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  // 储存当前头像的图片
  XFile? _currentAvatar;

  void _changeAvatar() async {
    final ImagePicker _picker = ImagePicker();
    try {
      // 从相册中选择图片
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        print('Image selected: ${image.path}'); // 添加日志输出
        setState(() {
          _currentAvatar = image;
        });
        // 返回到上一个页面，并传递新的头像路径
        Navigator.pop(context, image);
      } else {
        print('No image selected'); // 添加日志输出
      }
    } catch (e) {
      print('Error picking image: $e'); // 添加错误处理和日志输出
    }
  }

  @override
  Widget build(BuildContext context) {
    print('_currentAvatar: ${_currentAvatar?.path ?? 'null'}'); // 添加日志输出

    return Scaffold(
      appBar: AppBar(
        title: Text('更改头像'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: _currentAvatar == null
                  ? AssetImage('assets/avatar.jpg') as ImageProvider
                  : FileImage(File(_currentAvatar!.path)),
              radius: 100.0,
            ),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: _changeAvatar,
              child: Text('更改头像'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Theme.of(context).primaryColor, // 背景颜色
              ),
            ),
          ],
        ),
      ),
    );
  }
}
