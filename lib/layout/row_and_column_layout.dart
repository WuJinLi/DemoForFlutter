import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';

class RowAndColumnLayoutWidget extends StatefulWidget {
  @override
  _RowAndColumnLayoutWidgetState createState() =>
      _RowAndColumnLayoutWidgetState();
}

class _RowAndColumnLayoutWidgetState extends State<RowAndColumnLayoutWidget> {
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RowAndColumnLayout'),
        centerTitle: true,
      ),
      body: PageBaseWidget(
          layout: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: false,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            DescTextWidget(content: 'Row 是将子组件以水平方式布局的组件\n将3个组件水平排列'),
            Row(
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 50.0,
                  color: Colors.grey,
                ),
                Container(
                  width: 100.0,
                  height: 50.0,
                  color: Colors.blue,
                ),
                Container(
                  width: 100.0,
                  height: 50.0,
                  color: Colors.orange,
                )
              ],
            ),
            DescTextWidget(content: 'Column 是将子组件以垂直方式布局的组件\n将3个组件垂直排列：'),
            Column(
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 50.0,
                  color: Colors.grey,
                ),
                Container(
                  width: 100.0,
                  height: 50.0,
                  color: Colors.blue,
                ),
                Container(
                  width: 100.0,
                  height: 50.0,
                  color: Colors.orange,
                ),
              ],
            ),
            DescTextWidget(
                content:
                    '在 Row 和 Column 中有一个非常重要的概念：主轴（ MainAxis ） 和 交叉轴（ CrossAxis ），主轴就是与组件布局方向一致的轴，交叉轴就是与主轴方向垂直的轴。'),
            DescTextWidget(
                content: 'mainAxisAlignment 属性，此属性表示主轴方向的对齐方式，默认值为 start，'),
            Container(
              child: Column(
                children: <Widget>[
                  DescTextWidget(content: 'mainAxisAlignment属性设置'),
                  Wrap(
                    alignment: WrapAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            mainAxisAlignment = MainAxisAlignment.spaceAround;
                          });
                        },
                        child: Text('spaceAround'),
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            mainAxisAlignment = MainAxisAlignment.spaceBetween;
                          });
                        },
                        child: Text('spaceBetween'),
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            mainAxisAlignment = MainAxisAlignment.spaceEvenly;
                          });
                        },
                        child: Text('spaceEvenly'),
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            mainAxisAlignment = MainAxisAlignment.center;
                          });
                        },
                        child: Text('center'),
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            mainAxisAlignment = MainAxisAlignment.start;
                          });
                        },
                        child: Text('start'),
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            mainAxisAlignment = MainAxisAlignment.end;
                          });
                        },
                        child: Text('end'),
                      ),
                    ],
                  )
                ],
              ),
            ),
            DescTextWidget(
                content: 'mainAxisAlignment 属性，此属性表示主轴方向的对齐方式，默认值为 start，'),
            Container(
              child: Column(
                children: <Widget>[
                  DescTextWidget(content: 'mainAxisAlignment属性设置'),
                  Wrap(
                    alignment: WrapAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            crossAxisAlignment = CrossAxisAlignment.start;
                          });
                        },
                        child: Text('start'),
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            crossAxisAlignment = CrossAxisAlignment.center;
                          });
                        },
                        child: Text('center'),
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            crossAxisAlignment = CrossAxisAlignment.end;
                          });
                        },
                        child: Text('end'),
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            crossAxisAlignment = CrossAxisAlignment.stretch;
                          });
                        },
                        child: Text('stretch'),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 300.0,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.cyanAccent,
                    width: 1.0,
                    style: BorderStyle.solid),
              ),
              child: Row(
                mainAxisAlignment: this.mainAxisAlignment,
                crossAxisAlignment: this.crossAxisAlignment,
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 50.0,
                    color: Colors.grey,
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 100.0,
                    height: 150.0,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
            DescTextWidget(
                content:
                    '当前属性\nmainAxisAlignment：$mainAxisAlignment\ncrossAxisAlignment:\n$crossAxisAlignment'),
          ],
        ),
      )),
    );
    ;
  }
}
