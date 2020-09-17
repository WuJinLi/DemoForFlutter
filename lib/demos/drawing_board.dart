import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';

class DrawingBoard extends StatefulWidget {
  @override
  _DrawingBoardState createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingBoard> {
  //涉及到多次触控操作，则初始化数组为集合嵌套集合的方式，外边集合为一个完整流程操作的步骤，里边集合为当前操作步骤中移动数据的集合
  List<List<Offset>> _path = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('画板'),
        centerTitle: true,
      ),
      body: PageBaseWidget(
        layout: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    height: 40,
                    child: Text(
                      '清除',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        _path.clear();
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Listener(
                onPointerDown: (PointerDownEvent event) {
                  setState(() {
                    _path.add([event.localPosition]);
                  });
                },
                onPointerMove: (PointerMoveEvent event) {
                  setState(() {
                    _path[_path.length - 1].add(event.localPosition);
                  });
                },
                onPointerUp: (PointerUpEvent pointerUpEvent) {
                  setState(() {
                    _path[_path.length - 1].add(pointerUpEvent.localPosition);
                  });
                },
                onPointerCancel: (PointerCancelEvent pointerCancelEvent) {
                  setState(() {
                    _path[_path.length - 1]
                        .add(pointerCancelEvent.localPosition);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey[200],
                        width: 2,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: CustomPaint(
                    painter: DrawingBoardPainter(path: _path),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawingBoardPainter extends CustomPainter {
  List<List<Offset>> path;

  DrawingBoardPainter({this.path});

  Paint _paint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3;

  @override
  void paint(Canvas canvas, Size size) {
    path.forEach((list) {
      Path _path = Path();

      for (int index = 0; index < list.length; index++) {
        if (index == 0) {
          _path.moveTo(list[index].dx, list[index].dy);
        } else {
          _path.lineTo(list[index].dx, list[index].dy);
        }
      }
      canvas.drawPath(_path, _paint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
