import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';

class WarpLayout extends StatefulWidget {
  @override
  _WarpLayoutState createState() => _WarpLayoutState();
}

class _WarpLayoutState extends State<WarpLayout> {
  Axis _axis = Axis.horizontal;
  WrapAlignment _wrapAlignment = WrapAlignment.start;
  TextDirection _textDirection = TextDirection.ltr;
  VerticalDirection _verticalDirection = VerticalDirection.up;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warp'),
        centerTitle: true,
      ),
      body: PageBaseWidget(
        layout: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          reverse: false,
          child: Column(
            children: <Widget>[
              DescTextWidget(
                  content:
                      'Wrap \ndirection: Axis.horizontal/direction: Axis.vertical\n为子组件进行水平/垂直方向布局，且当空间用完时，Wrap 会自动换行，也就是流式布局。创建多个子控件做为 Wrap 的子控件'),
              axis(),
              DescTextWidget(content: 'alignment 属性控制主轴对齐方式'),
              _mainAxisAlignment(),
              DescTextWidget(
                  content:
                      'textDirection 属性表示 Wrap 主轴方向上子组件的方向，取值范围是 ltr（从左到右） 和 rtl（从右到左）'),
              _textDirectionWidget(),
              DescTextWidget(
                  content:
                      'verticalDirection 属性表示 Wrap 交叉轴方向上子组件的方向，取值范围是 up（向上） 和 down（向下）'),
              __verticalDirectionWidgets(),
              _showContent(),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: Text(
                  '$_wrapAlignment',
                  style:
                      TextStyle(color: Colors.lightBlueAccent, fontSize: 15.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget axis() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              setState(() {
                _axis = Axis.horizontal;
              });
            },
            child: Text(
              'Axis.horizontal',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                _axis = Axis.vertical;
              });
            },
            child: Text(
              'Axis.vertical',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }

  Widget _mainAxisAlignment() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Wrap(
        alignment: WrapAlignment.spaceAround,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              setState(() {
                _wrapAlignment = WrapAlignment.start;
              });
            },
            child: Text(
              'start',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                _wrapAlignment = WrapAlignment.end;
              });
            },
            child: Text(
              'end',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                _wrapAlignment = WrapAlignment.spaceBetween;
              });
            },
            child: Text(
              'spaceBetween',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                _wrapAlignment = WrapAlignment.center;
              });
            },
            child: Text(
              'center',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                _wrapAlignment = WrapAlignment.spaceEvenly;
              });
            },
            child: Text(
              'spaceEvenly',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _showContent() {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey[200], style: BorderStyle.solid, width: 1),
      ),
      child: Wrap(
        textDirection: _textDirection,
        direction: _axis,
        alignment: _wrapAlignment,
        verticalDirection: _verticalDirection,
        children: List.generate(5, (index) {
          double w = 50.0 + 10 * index;
          return Container(
            color: Colors.primaries[index],
            height: 50,
            width: w,
            child: Text(
              '$index',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          );
        }),
      ),
    );
  }

  Widget _textDirectionWidget() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              setState(() {
                _textDirection = TextDirection.ltr;
              });
            },
            child: Text(
              'ltr',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                _textDirection = TextDirection.rtl;
              });
            },
            child: Text(
              'rtl',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget __verticalDirectionWidgets() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              setState(
                () {
                  _verticalDirection = VerticalDirection.up;
                },
              );
            },
            child: Text(
              'up',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(
                () {
                  _verticalDirection = VerticalDirection.down;
                },
              );
            },
            child: Text(
              'down',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          )
        ],
      ),
    );
  }
}
