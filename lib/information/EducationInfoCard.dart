import 'package:flutter/material.dart';

// 更改类名
class EducationInfoCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;

  const EducationInfoCard({
    Key? key,
    required this.title,
    required this.content,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: Icon(icon, size: 48.0, color: Theme.of(context).primaryColor),
            title: Text(title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0),
            child: Text(content, style: TextStyle(fontSize: 16.0, color: Colors.grey[600])),
          ),
        ],
      ),
    );
  }
}