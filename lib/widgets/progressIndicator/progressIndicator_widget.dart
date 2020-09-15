import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';
import 'package:flutter/cupertino.dart';

class ProgressIndicatorWidget extends StatefulWidget {
  @override
  _ProgressIndicatorWidgetState createState() =>
      _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProgressIndicator'),
        centerTitle: true,
      ),
      body: PageBaseWidget(
        layout: Column(
          children: <Widget>[
            DescTextWidget(content: 'LinearProgressIndicator:水平进度指示器'),
            Divider(height: 10),
            LinearProgressIndicator(),
            Divider(
              height: 20,
              color: Colors.transparent,
            ),
            LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.greenAccent,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
            Divider(
              height: 10,
              color: Colors.transparent,
            ),
            DescTextWidget(content: 'CircularProgressIndicator:是圆形进度条'),
            Divider(
              height: 20.0,
            ),
            CircularProgressIndicator(),
            Divider(
              height: 20,
              color: Colors.transparent,
            ),
            CircularProgressIndicator(
              value: 0.5,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
            DescTextWidget(
                content:
                    'CupertinoActivityIndicator:ios风格的指示器,能设置进度，只能一直转“菊花”'),
            Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              child: CupertinoActivityIndicator(
                radius: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
