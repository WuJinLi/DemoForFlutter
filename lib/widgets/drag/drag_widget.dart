import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/width_match_button_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';

class DragWidget extends StatefulWidget {
  @override
  _DragWidgetState createState() => _DragWidgetState();
}

class _DragWidgetState extends State<DragWidget> {
  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
        title: '拖拽组件',
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          reverse: false,
          child: Column(
            children: <Widget>[
              DescTextWidget(
                  content:
                      '拖拽组件包含 Draggable 、LongPressDraggable 和 DragTarget。Draggable、LongPressDraggable 为可拖拽的组件，LongPressDraggable 继承自Draggable，因此用法和 Draggable 完全一样，唯一的区别就是 LongPressDraggable 触发拖动的方式是长按，而 Draggable 触发拖动的方式是按下。DragTarget 为拖拽组件的目的地组件。'),
              Draggable(
                child: Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Text(
                    'flutter',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                feedback: Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Text(
                    'flutter',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                onDragStarted: () {
                  print('onDragStarted');
                },
                onDragEnd: (DraggableDetails details) {
                  print('onDragEnd:$details');
                },
                onDraggableCanceled: (Velocity velocity, Offset offset) {
                  print(
                      'onDraggableCanceled velocity:$velocity,offset:$offset');
                },
                onDragCompleted: () {
                  print('onDragCompleted');
                },
              )
            ],
          ),
        ));
  }
}
