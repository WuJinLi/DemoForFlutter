import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';

class AnimationControllerDemo extends StatefulWidget {
  @override
  _AnimationControllerDemoState createState() =>
      _AnimationControllerDemoState();
}

class _AnimationControllerDemoState extends State<AnimationControllerDemo>
    with SingleTickerProviderStateMixin {
  double _size = 100;
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      lowerBound: 150,
      upperBound: 300,
    )
      ..addListener(() {
        setState(() {
          print('${_controller.value}');
          _size = _controller.value;
        });
      })
      ..addStatusListener((status) {
        // print('$status');
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
      title: 'AnimationController',
      child: SingleChildScrollView(
        child: Column(
          children: [
            DescTextWidget(
                content:
                    '动画系统的核心是 AnimationController，而且是不可或缺的，动画中必须有 AnimationController，而 Tween 和 Curve 则是对 AnimationController 的补充'),
            Container(
              alignment: Alignment.center,
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: _size,
                  height: _size,
                  color: Colors.blue,
                  child: Text(
                    '点我变大',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                onTap: () {
                  _controller.forward();
                },
              ),
            )
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
