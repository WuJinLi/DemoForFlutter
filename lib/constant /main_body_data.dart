import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/text_widget.dart';

class MainPageBodyData {
  String title;
  Color color;
  double size;
  String image;
  Widget widget;
  MainPageBodyData(
      {@required this.title,
      @required this.color,
      @required this.image,
      this.widget});
}

List<MainPageBodyData> initMainPageData() {
  return new List()
    ..add(
      new MainPageBodyData(
        title: '文本组件',
        color: Colors.lightBlue,
        image: 'images/img_text_widget.png',
        widget: TextWidgetPage(),
      ),
    )
    ..add(
      new MainPageBodyData(
        title: '按钮组件',
        color: Colors.lightBlueAccent,
        image: 'images/img_buttom_widget.png',
      ),
    )
    ..add(
      new MainPageBodyData(
        title: '单选组件',
        color: Colors.lightGreen,
        image: 'images/img_text_widget.png',
      ),
    )
    ..add(
      new MainPageBodyData(
        title: '复选组件',
        color: Colors.lightGreenAccent,
        image: 'images/img_text_widget.png',
      ),
    )
    ..add(
      new MainPageBodyData(
        title: '滑块组件',
        color: Colors.lightBlue,
        image: 'images/img_text_widget.png',
      ),
    )
    ..add(
      new MainPageBodyData(
        title: '开关组件',
        color: Colors.lightBlue,
        image: 'images/img_text_widget.png',
      ),
    )
    ..add(
      new MainPageBodyData(
        title: '进度组件',
        color: Colors.lightBlue,
        image: 'images/img_text_widget.png',
      ),
    )
    ..add(
      new MainPageBodyData(
        title: '图片图标组件',
        color: Colors.lightBlue,
        image: 'images/img_text_widget.png',
      ),
    );
}
