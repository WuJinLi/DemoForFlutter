import 'package:flutter/material.dart';

import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/width_match_button_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';

class AnimationControllerDemo extends StatefulWidget {
  @override
  _AnimationControllerDemoState createState() =>
      _AnimationControllerDemoState();
}

class _AnimationControllerDemoState extends State<AnimationControllerDemo>
    with SingleTickerProviderStateMixin {
  double _size = 100.0;
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..addListener(() {
            setState(() {
              _size = 100 + 100 * _controller.value;
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _controller.forward();
            }
          });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
        title: 'AnimationController',
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              WidthMatchBottonWidget(
                  title: '放大',
                  onPressed: () {
                    _controller.forward();
                  }),
              WidthMatchBottonWidget(
                  title: '停止',
                  onPressed: () {
                    _controller.stop();
                  }),
              Container(
                alignment: Alignment.center,
                width: _size,
                height: _size,
                color: Colors.blue,
                child: Text(
                  '$_size',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
              DescTextWidget(
                  content:
                      'AnimationController，它是动画控制器，控制动画的启动、停止，还可以获取动画的运行状态，AnimationController 通常在 initState 方法中初始化：'),
              DescTextWidget(
                  content:
                      '这里有两个参数需要设置：\nvsync：当创建 AnimationController 时，需要传递一个vsync参数，存在vsync时会防止屏幕外动画消耗不必要的资源，单个 AnimationController 的时候使用 SingleTickerProviderStateMixin，多个 AnimationController 使用 TickerProviderStateMixin。\nduration：表示动画执行的时间。'),
            ],
          ),
        ));
  }
}
