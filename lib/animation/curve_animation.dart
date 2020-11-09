import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/width_match_button_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';

class CurveAnimation extends StatefulWidget {
  @override
  _CurveAnimationState createState() => _CurveAnimationState();
}

class _CurveAnimationState extends State<CurveAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _animation = Tween(begin: 100.0, end: 200.0)
        .chain(CurveTween(curve: Curves.bounceIn))
        .animate(_controller)
          ..addListener(() {
            setState(() {});
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
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
      title: 'curve',
      child: SingleChildScrollView(
        child: Column(
          children: [
            DescTextWidget(
                content: '蓝色盒子大小 100 变大到 200，动画曲线设置为 bounceIn（弹簧效果）'),
            WidthMatchBottonWidget(
                title: 'start',
                onPressed: () {
                  _controller.forward();
                }),
            Container(
              width: _animation.value,
              height: _animation.value,
              color: Colors.blue,
            ),
            DescTextWidget(content: 'Curve 是 AnimationController 动画执行曲线，默认是线性运行。'),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}
