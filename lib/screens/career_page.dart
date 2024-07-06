import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// CareerAssessmentPage.dart

class CareerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('职业规划'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Text(
            '职业规划简介',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Text(
            '这里是一些关于职业规划的基本介绍和指引，帮助你更好地规划你的职业生涯。',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 20.0),
          Text(
            '主要功能',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CareerAssessmentPage()));
            },
            child: Text('职业评估'),
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CareerExplorationPage()));
            },
            child: Text('职业探索'),
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CareerPlanningPage()));
            },
            child: Text('制定计划'),
          ),
        ],
      ),
    );
  }
}

class CareerAssessmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('职业评估'),
      ),
      body: Center(
        child: FutureBuilder<Uint8List>(
          future: fetchImage(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Image.memory(snapshot.data!, width: 400, height: 400);
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<Uint8List> fetchImage() async {
    final response = await http.get(Uri.parse('https://pic1.zhimg.com/v2-4a921ea3feda4f1763c0f917fd967c50_r.jpg'));
    if (response.statusCode == 200) {
      return Uint8List.fromList(response.bodyBytes);
    } else {
      throw Exception('Failed to load image');
    }
  }
}

// CareerExplorationPage.dart
class CareerExplorationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('职业探索'),
      ),
      body: Center(
        child: Text('大学生职业探索之旅：启航梦想，探索无限可能\n'

    '       作为大学生，你正站在职业生涯的起点，面临着广阔的职业世界和无数的选择。职业探索之旅将帮助你启航梦想，发现属于自己的无限可能。\n'

    '       职业探索的第一步是认识自我。深入了解自己的兴趣、优势和价值观，明确什么样的工作环境和内容能够让你充满激情和满足感。这是找到适合自己职业方向的重要基础。\n'

    '       接下来，积极展开行业调研，了解不同行业的发展趋势、就业机会和潜在挑战。通过与行业内的前辈、校友或专业人士交流，获取宝贵的经验和建议，为自己的职业决策提供参考。\n'

    '       同时，不要害怕走出课堂，积极参与实习、志愿服务和项目实践。这些实践经验将帮助你更好地了解职场环境，提升专业技能和软技能，并为未来的职业发展打下坚实的基础。\n'

    '       在职业探索的过程中，也要保持开放和灵活的心态。职业世界充满变数，你可能会发现自己的兴趣和目标在不断演变。因此，及时调整策略，保持学习的热情，不断适应和成长。\n'

    '       最重要的是，相信自己的潜力和能力。职业探索之旅是一个充满挑战和机遇的过程，但只要你保持积极的态度和坚定的信念，就一定能够找到属于自己的职业道路，并实现个人的梦想和目标。\n'

    '       现在，就踏上这段充满探索与发现的职业之旅吧！勇敢地追寻自己的梦想，探索无限的职业可能。未来的成功正等待着你的到来！\n'),
      ),
    );
  }
}

// CareerPlanningPage.dart
class CareerPlanningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('制定计划'),
      ),
      body: Center(
        child: Text('大学生制定计划：规划未来，筑梦前行\n'

    '       作为大学生，你正处于人生的黄金时期，面临着无数的选择和机遇。制定一份明确的计划，将帮助你规划未来，筑梦前行，实现个人的成长与成功。\n'

    '       制定计划的第一步是明确目标。思考你希望在学业、职业和个人发展方面达到什么样的成就。设定具体、可衡量的目标，这将为你提供明确的方向和动力。\n'

    '       接下来，分析现状与挑战。审视自己目前所处的位置，识别自身的优势和不足。同时，预见可能遇到的挑战和障碍，并思考如何应对和克服它们。\n'

    '       在制定计划时，务必注重时间的合理分配。合理安排学习、实践、休息和娱乐的时间，确保计划的可行性和可持续性。同时，设定明确的里程碑和时间表，以便跟踪进度并及时调整计划。\n'

    '       不要忘记寻求支持与反馈。与家人、朋友、导师或同学分享你的计划，并征求他们的意见和建议。他们的支持和鼓励将成为你制定计划过程中的宝贵资源。\n'

    '       最后，保持灵活与调整。计划只是指导你前行的工具，而不是束缚你的枷锁。随时准备根据实际情况和自身需求进行调整，确保计划始终与你的目标和梦想保持一致。\n'

    '       制定计划是一个持续的过程，它需要你不断地思考、学习和成长。通过制定明确的计划，你将能够更好地把握大学时光，为未来的职业生涯奠定坚实的基础，并实现个人的价值与梦想。\n'

    '       现在，就拿起笔，开始制定属于你的计划吧！规划未来，筑梦前行，让每一步都充满意义与成就。未来的成功正等待着你的到来！\n'),
      ),
    );
  }
}
