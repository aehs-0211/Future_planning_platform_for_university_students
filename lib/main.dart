import 'package:flutter/material.dart';
import 'package:univercitys/information/scaffold_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '大学生未来规划平台',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScaffoldRoute(), // 使用新的ScaffoldRoute作为首页
    );
  }
}

