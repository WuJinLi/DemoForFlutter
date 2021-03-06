import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/width_match_button_widget.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';

class TweenDemo extends StatefulWidget {
  @override
  _TweenDemoState createState() => _TweenDemoState();
}

class _TweenDemoState extends State<TweenDemo> with TickerProviderStateMixin {
  Color _startColor = Colors.blue;
  Color _endColor = Colors.red;
  Color _color = Colors.blue;
  AnimationController _controller;

  AnimationController _colorAnimationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
          ..addListener(() {
            setState(() {
              _color = Color.lerp(_startColor, _endColor, _controller.value);
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _controller.forward();
            }
          });

    _colorAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..addListener(() {
            setState(() {});
          });

    _animation = ColorTween(begin: Colors.blue, end: Colors.red)
        .animate(_colorAnimationController);
  }

  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
      title: 'Tween',
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DescTextWidget(
              content:
                  'Tween 实现了将 AnimationController [0,1]的值映射为其他类型的值，比如颜色、样式等',
            ),
            DescTextWidget(
              content: 'AnimationController实现颜色的渐变',
            ),
            WidthMatchBottonWidget(
                title: '开始变色',
                onPressed: () {
                  _controller.forward();
                }),
            WidthMatchBottonWidget(
                title: '停止',
                onPressed: () {
                  _controller.stop();
                }),
            Container(
              width: 100,
              height: 100,
              color: _color,
            ),
            DescTextWidget(content: 'Tween实现颜色的渐变'),
            WidthMatchBottonWidget(
                title: '开始变色',
                onPressed: () {
                  _colorAnimationController.forward();
                }),
            WidthMatchBottonWidget(
                title: '停止',
                onPressed: () {
                  _colorAnimationController.stop();
                }),
            Container(
              width: 100,
              height: 100,
              color: _animation.value,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _colorAnimationController.dispose();
    super.dispose();
  }
}
