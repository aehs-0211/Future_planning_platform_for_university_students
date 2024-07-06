import 'dart:async';

import 'package:flutter/material.dart';
import 'package:univercitys/information/EducationInfoCard.dart';
import 'package:univercitys/information/info_card.dart';

class EducationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('教育规划'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // 执行搜索逻辑
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              padding: EdgeInsets.all(10.0),
              children: <Widget>[
                _buildButton(context, '考研', GraduateExamPage()),
                _buildButton(context, '保研', PostgraduateRecommendationPage()),
                _buildButton(context, '本科学习', UndergraduateStudyPage()),
                _buildButton(context, '其他', OtherEducationPage()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Widget page) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Text(text),
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 1.0, color: Colors.redAccent), // 设置边框宽度和颜色
        backgroundColor: Colors.white, // 文本和边框的颜色
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0), // 调整内边距
        minimumSize: Size(88, 36), // 设置按钮的最小尺寸
        // 可以添加其他你想要的样式属性
      ),
    );
  }
}

class GraduateExamNews {
  final String title;
  final String content;

  GraduateExamNews({required this.title, required this.content});
}

class RecommendationStep {
  final String title;
  final String description;

  RecommendationStep({required this.title, required this.description});
}


// 以下是示例页面类，你需要替换成你自己的页面实现
// 假设的辅助类，用于存储考研资讯
List<GraduateExamNews> mockNews = [
  GraduateExamNews(title: '考研最新政策解读', content: '详细解读今年考研的最新政策...'),
  GraduateExamNews(title: '高效复习方法分享', content: '分享一些高效的考研复习方法...'),
  // 可以继续添加更多考研资讯
];

class GraduateExamPage extends StatefulWidget {
  @override
  _GraduateExamPageState createState() => _GraduateExamPageState();
}

class _GraduateExamPageState extends State<GraduateExamPage> {
  // 考研倒计时（示例，实际中可能需要从服务器获取具体日期）
  Timer? _timer;
  late DateTime _examDate;

  @override
  void initState() {
    super.initState();
    // 假设考研日期是明年的1月1日
    _examDate = DateTime(DateTime.now().year + 1, 1, 1);
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer t) => setState(() {}),
    );
  }

  String _getExamCountdown() {
    Duration difference = _examDate.difference(DateTime.now());
    if (difference.isNegative) {
      return '考研已结束';
    }
    return '${difference.inDays}天 ${difference.inHours % 24}小时 ${difference.inMinutes % 60}分钟 ${difference.inSeconds % 60}秒';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('考研页面'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '考研倒计时',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  _getExamCountdown(),
                  style: TextStyle(fontSize: 18.0, color: Colors.red),
                ),
                SizedBox(height: 24.0),
                Text(
                  '考研资讯',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                ...mockNews.map((news) => ListTile(
                  title: Text(news.title),
                  subtitle: Text(news.content),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // 这里可以跳转到详情页面，暂时只是打印
                    print('查看资讯详情: ${news.title}');
                  },
                )).toList(),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    // 模拟进入考试界面，可以跳转到另一个页面
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MockExamPage()));
                  },
                  child: Text('进入模拟考试'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 模拟的考试页面，实际应用中需要详细设计
class MockExamPage extends StatelessWidget {
  final List<String> questions = [
    '题目1: 请解释什么是面向对象编程？',
    '题目2: 在Flutter中，如何定义一个StatefulWidget？',
    '题目3: 简述HTTP和HTTPS的区别。',
    // 可以继续添加更多题目
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('模拟考试'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Text('${index + 1}.', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              title: Text(questions[index]),
              // 可以添加trailing来放置答案按钮或切换显示答案的控件
              trailing: IconButton(
                icon: Icon(Icons.check, color: Colors.green),
                onPressed: () {
                  // 这里可以添加查看答案的逻辑，暂时只是打印
                  print('查看答案: ${questions[index]}');
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class PostgraduateRecommendationPage extends StatefulWidget {
  @override
  _PostgraduateRecommendationPageState createState() => _PostgraduateRecommendationPageState();
}

class _PostgraduateRecommendationPageState extends State<PostgraduateRecommendationPage> {
  final List<RecommendationStep> _steps = [
    RecommendationStep(title: '步骤1: 准备材料', description: '收集所有必要的申请材料，如成绩单、推荐信等。'),
    RecommendationStep(title: '步骤2: 了解院校', description: '研究不同院校的专业设置、录取标准和申请流程。'),
    RecommendationStep(title: '步骤3: 提交申请', description: '按照院校要求提交申请，并留意截止日期。'),
    // 可以继续添加更多步骤
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('保研推荐'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '保研推荐指南',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              '以下是一些保研推荐的步骤和建议，希望能帮助到你。',
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
            SizedBox(height: 24.0),
            Expanded(
              child: ListView.builder(
                itemCount: _steps.length,
                itemBuilder: (context, index) {
                  final step = _steps[index];
                  return ListTile(
                    title: Text(step.title, style: TextStyle(fontSize: 18.0)),
                    subtitle: Text(step.description, style: TextStyle(fontSize: 14.0, color: Colors.grey[600])),
                  );
                },
              ),
            ),
            // 假设这里有一个表单，用于收集额外信息
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: '你的研究兴趣'),
                  ),
                  // 可以继续添加更多表单字段
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // 处理表单提交逻辑
                print('表单已提交');
                // 可以跳转到另一个页面或显示Snackbar等
              },
              child: Text('提交推荐信息'),
            ),
          ],
        ),
      ),
    );
  }
}

class UndergraduateStudyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('本科学习页面'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Text(
            '本科学习指南',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.blueAccent),
          ),
          SizedBox(height: 24.0),
          // 学习技巧卡片
          InfoCard(
            title: '学习技巧',
            content: '制定合理的学习计划，保持专注，及时复习巩固。',
            icon: Icons.book,
          ),
          // 课程推荐卡片
          InfoCard(
            title: '课程推荐',
            content: '推荐学习《数据结构》、《算法设计》等基础课程，为后续学习打下坚实基础。',
            icon: Icons.school,
          ),
          // 时间管理建议卡片
          InfoCard(
            title: '时间管理',
            content: '合理分配时间，避免拖延，确保学习与生活的平衡。',
            icon: Icons.access_time,
          ),
          // 可以继续添加更多相关卡片
        ],
      ),
    );
  }
}

class OtherEducationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('其他教育机会'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // 执行搜索逻辑，这里只是打印消息
              print('执行搜索...');
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          // 标题
          Text(
            '探索更多教育机会',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0), // 添加一些间距

          // 信息卡片列表（使用新的类名 EducationInfoCard）
          EducationInfoCard(
            title: '在线课程推荐',
            content: '发现最新的在线课程，提升你的技能。',
            icon: Icons.laptop,
          ),
          EducationInfoCard(
            title: '国际交流项目',
            content: '参与国际交流项目，拓宽视野，增进跨文化交流能力。',
            icon: Icons.flight_takeoff,
          ),
          EducationInfoCard(
            title: '奖学金申请指南',
            content: '了解各类奖学金的申请条件和流程，为你的学业助力。',
            icon: Icons.monetization_on,
          ),

          // 分隔线
          Divider(height: 20.0, color: Colors.grey[300]),

          //图片展示（假设是一些教育活动的图片）
          // GridView.count(
          //   crossAxisCount: 2,
          //   childAspectRatio: 0.7,
          //   padding: EdgeInsets.all(10.0),
          //   mainAxisSpacing: 10.0,
          //   crossAxisSpacing: 10.0,
          //   children: <Widget>[
          //     Image.network(
          //       'https://img1.baidu.com/it/u=2938315277,659903927&fm=253&fmt=auto&app=138&f=JPEG?w=285&h=379', // 替换为实际图片URL
          //       fit: BoxFit.cover,
          //     ),
          //     Image.network(
          //       'https://bpic.588ku.com/back_list_pic/22/05/12/45f11e13e4fdcb95c24fa4a79b02b84d.jpg!/fw/389.71161340608/quality/90/unsharp/true/compress/true', // 替换为实际图片URL
          //       fit: BoxFit.cover,
          //     ),
          //     // 可以继续添加更多图片
          //   ],
          // ),

          // 可交互列表视图（假设是一些教育资源链接）
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '精选教育资源',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5, // 假设有5个资源
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('资源${index + 1}标题'),
                      subtitle: Text('资源${index + 1}的简短描述'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // 这里可以添加点击事件，如打开网页等
                        print('打开资源${index + 1}');
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}