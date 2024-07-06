import 'package:flutter/material.dart';

class BudgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('预算'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '这里是你的预算页面',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              '在这个页面中，你可以查看和管理你的预算。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              '你可以设置每月的收入和支出，以及为不同的类别分配预算。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              '通过合理规划预算，你可以更好地控制你的财务状况，实现你的财务目标。',
              style: TextStyle(fontSize: 16),
            ),
            // 你可以继续添加更多的文本内容
          ],
        ),
      ),
    );
  }
}

class InvestmentPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('投资规划'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '这里是你的投资规划页面',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              '在这个页面中，你可以查看和管理你的投资规划。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              '你可以设置你的长期和短期投资目标，以及规划如何达成这些目标。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              '通过合理的投资规划，你可以更好地增值你的财富，实现你的财务自由。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24.0),
            Text(
              '你的投资目标：',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.trending_up),
                    title: Text('长期投资目标'),
                    subtitle: Text('例如：退休基金、子女教育基金等'),
                  ),
                  ListTile(
                    leading: Icon(Icons.short_text),
                    title: Text('短期投资目标'),
                    subtitle: Text('例如：旅行基金、紧急备用金等'),
                  ),
                  // 你可以继续添加更多的ListTile来表示不同的投资目标或计划
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SavingsTipsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('节省开支的建议'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('这里是一些节省开支的小技巧：'),
            SizedBox(height: 8.0),
            // 直接使用Column来展示多个节省技巧
            Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.money),
                  title: Text('技巧1：制定预算并坚持执行'),
                ),
                ListTile(
                  leading: Icon(Icons.restaurant),
                  title: Text('技巧2：减少外出就餐，自己烹饪'),
                ),
                ListTile(
                  leading: Icon(Icons.local_offer),
                  title: Text('技巧3：利用优惠券和促销活动'),
                ),
                // 你可以继续添加更多的节省技巧
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('关闭'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class FinancialKnowledgeDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('财务知识'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('这里是一些基本的财务知识，帮助你更好地管理你的财务：'),
            SizedBox(height: 8.0),
            // 直接使用Column来展示多个财务知识点
            Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.trending_up),
                  title: Text('知识点1：理解你的收入和支出'),
                ),
                ListTile(
                  leading: Icon(Icons.savings),
                  title: Text('知识点2：建立一个紧急储备金'),
                ),
                ListTile(
                  leading: Icon(Icons.credit_card),
                  title: Text('知识点3：明智地使用信用卡'),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('关闭'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}


class FinancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('财务规划'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Text(
            '个人财务规划',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Text(
            '欢迎来到你的个人财务规划页面。在这里，你可以查看和管理你的财务状况，制定预算，以及规划你的未来投资。',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 20.0),
          Text(
            '当前财务状况',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('总资产'),
            subtitle: Text('￥100,000'),
          ),
          ListTile(
            leading: Icon(Icons.money),
            title: Text('月收入'),
            subtitle: Text('￥8,000'),
          ),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('月支出'),
            subtitle: Text('￥5,000'),
          ),
          SizedBox(height: 20.0),
          Text(
            '预算与规划',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: Icon(Icons.show_chart),
            title: Text('查看预算'),
            subtitle: Text('查看和编辑你的月度预算'),
            onTap: () {
              // 导航到预算页面
              Navigator.push(context, MaterialPageRoute(builder: (context) => BudgetPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.trending_up),
            title: Text('投资规划'),
            subtitle: Text('制定你的长期和短期投资目标'),
            onTap: () {
              // 导航到投资规划页面
              Navigator.push(context, MaterialPageRoute(builder: (context) => InvestmentPlanPage()));
            },
          ),
          SizedBox(height: 20.0),
          Text(
            '财务建议',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: Icon(Icons.lightbulb_outline),
            title: Text('节省开支'),
            subtitle: Text('学习如何节省开支并增加储蓄'),
            onTap: () {
              // 显示节省开支的建议
              showDialog(context: context, builder: (_) => SavingsTipsDialog());
            },
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('财务知识'),
            subtitle: Text('提升你的财务知识和技能'),
            onTap: () {
              // 导航到财务知识页面
              showDialog(context: context, builder: (_) => FinancialKnowledgeDialog());
            },
          ),
        ],
      ),
    );
  }
}
