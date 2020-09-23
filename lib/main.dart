import 'package:flutter/material.dart';
import 'constant/main_body_data.dart';
import 'widgets/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Demo',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: HomePage(),
      // MainPageBody(
      //   list: initMainPageData(),
      // ),

      drawer: Drawer(
        child: _drawerLayout(),
      ),
    );
  }

  Widget _drawerLayout() {
    return ListView(
      children: <Widget>[
//              DrawerHeader(child: Text("这是头像")),
        Row(
          children: <Widget>[
            Expanded(
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  //头部布局背景
                    image: DecorationImage(
                        image: AssetImage("images/img_sliver_appbar.jpeg"), fit: BoxFit.cover)),
                accountName: Text("张三"),
                //用户名
                accountEmail: Text("zhangsan@163.com"),
                //邮箱
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("images/img_sliver_appbar.jpeg"),
                ),
                //头像
                otherAccountsPictures: <Widget>[
                  Icon(Icons.account_balance),
                  Icon(Icons.widgets),
                  Icon(Icons.map)
                ],
                onDetailsPressed: () {
                  Navigator.pop(context); //关闭抽屉//详情页面跳转
                },
              ),
            )
          ],
        ), //抽屉栏头部布局
        drawerItem(
            title: "我的",icon: Icon(Icons.perm_identity)),
        Divider(), //分割线控件
        drawerItem(title: "设置",icon: Icon(Icons.settings)),
        Divider(),
        drawerItem(
          title: "主页",icon: Icon(Icons.home)),
        Divider(),
        drawerItem(
          title: "热门",icon: Icon(Icons.format_align_right)),
      ],
    );
  }

  Widget drawerItem({String title, Icon icon, String path, arguments}) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        child: icon,
      ),
      onTap: () {
        Navigator.pop(context); //关闭抽屉
      },
    );
  }
}
