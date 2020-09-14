import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ButtomWidget extends StatefulWidget {
  @override
  _ButtomWidgetState createState() => _ButtomWidgetState();
}

class _ButtomWidgetState extends State<ButtomWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('buttom'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: RaisedButton(
                  elevation: 0,
                  //正常状态下，背景颜色
                  color: Colors.lightBlueAccent,
                  //正常状态下，字体颜色
                  textColor: Colors.white,
                  //禁用状态下，字体颜色
                  disabledTextColor: Colors.grey,
                  //禁用状态下，背景颜色
                  disabledColor: Colors.grey,
                  //高亮颜色，按下时的颜色
                  highlightColor: Colors.blueAccent,
                  //水波纹颜色，按下时会有水波纹效果
                  splashColor: Colors.transparent,
                  //正常按压点击
                  onPressed: () {
                    Toast.show('RaisedButton-onPressed', context);
                  },
                  //长按
                  onLongPress: () {
                    Toast.show('RaisedButton-onLongPress', context);
                  },
                  onHighlightChanged: (value) {
                    Toast.show(
                        'RaisedButton-onHighlightChanged:$value', context);
                  },
                  child: Text(
                    'RaisedButton',
                    style: TextStyle(color: Colors.white),
                  ),
                ))
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    //正常按压点击
                    onPressed: () {
                      Toast.show('FlatButton-onPressed', context);
                    },
                    //长按
                    onLongPress: () {
                      Toast.show('FlatButton-onLongPress', context);
                    },
                    onHighlightChanged: (value) {
                      Toast.show(
                          'FlatButton-onHighlightChanged:$value', context);
                    },
                    child: Text('FlatButton'),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: OutlineButton(
                    //正常按压点击
                    onPressed: () {
                      Toast.show('OutlineButton-onPressed', context);
                    },
                    //长按
                    onLongPress: () {
                      Toast.show('OutlineButton-onLongPress', context);
                    },
                    child: Text('OutlineButton'),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      Toast.show('IconButton-onPressed', context);
                    },
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              child: Text(
                'RaisedButton：Material风格”凸起“的按钮。\nFlatButton：扁平的按钮。\nOutlineButton：带边框的按钮',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              child: Text(
                '事件回调方法\nonPressed：点击回调\nonLongPress：长按回调\nonHighlightChanged：按钮高亮变化回调，当点击或者按住按钮时，按钮出现水波纹效果，水波纹变化时就是高亮状态',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 15.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
