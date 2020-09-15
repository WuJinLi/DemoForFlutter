import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';
import 'package:flutter/cupertino.dart';

class SwitchWidget extends StatefulWidget {
  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  var _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch'),
        centerTitle: true,
      ),
      body: PageBaseWidget(
          layout: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: false,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            DescTextWidget(content: 'Switch:'),
            Text('switch选择状态:$_switchValue'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Switch(
                  value: _switchValue,
                  onChanged: (bool newValue) {
                    setState(() {
                      _switchValue = newValue;
                    });
                  },
                ),
                Switch(
                  value: _switchValue,
                  //打开状态下滑块的颜色
                  activeColor: Colors.deepPurpleAccent,
                  //打开状态下主轴的颜色
                  activeTrackColor: Colors.orange,
                  //关闭状态下主轴的颜色
                  inactiveTrackColor: Colors.green,
                  //关闭状态下滑块的颜色
                  inactiveThumbColor: Colors.red,
                  activeThumbImage: AssetImage('images/img_bird.png'),
                  inactiveThumbImage: AssetImage('images/img_dog.png'),
                  onChanged: (bool newValue) {
                    setState(() {
                      _switchValue = newValue;
                    });
                  },
                ),
              ],
            ),
            DescTextWidget(content: 'SwitchListTile:'),
            SwitchListTile(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
              title: Text('是否允许4G下载'),
              subtitle: Text('4G下载速度更快哦'),
            ),
            DescTextWidget(content: 'CupertinoSwitch:ios风格控件'),
            CupertinoSwitch(
                value: _switchValue,
                onChanged: (value) {
                  setState(() {
                    _switchValue = value;
                  });
                }),
          ],
        ),
      )),
    );
  }
}
