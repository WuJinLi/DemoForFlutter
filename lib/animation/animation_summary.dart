import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/width_match_button_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';

class AnimationSummary extends StatefulWidget {
  @override
  _AnimationSummaryState createState() => _AnimationSummaryState();
}

class _AnimationSummaryState extends State<AnimationSummary>
    with TickerProviderStateMixin {
  AnimationController _sizeController;
  AnimationController _colorController;

  Animation<double> _sizeAnimation;
  Animation<Color> _colorAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sizeController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _sizeController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _sizeController.forward();
            }
          });

    _sizeAnimation = _sizeController
        .drive(CurveTween(curve: Curves.linear))
        .drive(Tween(begin: 100.0, end: 200.0));

    _colorController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _colorController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _colorController.forward();
            }
          });

    _colorAnimation = _colorController
        .drive(CurveTween(curve: Curves.bounceIn))
        .drive(ColorTween(begin: Colors.blue, end: Colors.red));
  }

  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
        title: '动画总结',
        child: SingleChildScrollView(
          child: Column(
            children: [
              DescTextWidget(
                content:
                    '动画系统的核心是 AnimationController，而且是不可或缺的，动画中必须有 AnimationController，而 Tween 和 Curve 则是对 AnimationController 的补充， Tween 实现了将 AnimationController [0,1]的值映射为其他类型的值，比如颜色、样式等，Curve 是 AnimationController 动画执行曲线，默认是线性运行。',
              ),
              DescTextWidget(
                  content:
                      '将 AnimationController 、 Tween 、Curve 进行关联的方式：AnimationController的drive方法进行多动画的关联'),
              DescTextWidget(
                  content:
                      '一个 AnimationController 可以对应多个 Animation（Tween 或者 Curve），StatefulWidget 组件可以包含多个 AnimationController ，但 SingleTickerProviderStateMixin 需要修改为 TickerProviderStateMixin，改变颜色和大小，由两个 AnimationController 控制：'),
              WidthMatchBottonWidget(
                  title: '开始',
                  onPressed: () {
                    _colorController.forward();
                    _sizeController.forward();
                  }),
              Container(
                width: _sizeAnimation.value,
                height: _sizeAnimation.value,
                color: _colorAnimation.value,
              )
            ],
          ),
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _colorController.dispose();
    _sizeController.dispose();
    super.dispose();
  }
}
