import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';

class RadioWidget extends StatefulWidget {
  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  var _radioGroupValue = '语文';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            DescTextWidget(
                content:
                    'Radio:\nRadio控件本身没有State状态，当value的值和groupValue值相等时，Radio显示选中状态'),
            Row(
              children: <Widget>[
                Radio(
                  activeColor: Colors.cyanAccent,
                  //activeColor是选中状态下颜色
                  autofocus: true,
                  value: '语文',
                  groupValue: _radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      Toast.show('$value', context);
                      _radioGroupValue = value;
                    });
                  },
                ),
                Radio(
                  activeColor: Colors.cyanAccent,
                  value: '数学',
                  groupValue: _radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      Toast.show('$value', context);
                      _radioGroupValue = value;
                    });
                  },
                ),
                Radio(
                  activeColor: Colors.cyanAccent,
                  value: '英语',
                  groupValue: _radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      Toast.show('$value', context);
                      _radioGroupValue = value;
                    });
                  },
                ),
              ],
            ),
            DescTextWidget(content: 'RadioListTile:'),
            Row(
              children: <Widget>[
                Flexible(
                  child: RadioListTile(
                    title: Text(
                      '语文',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    value: '语文',
                    groupValue: _radioGroupValue,
                    onChanged: (value) {
                      setState(() {
                        _radioGroupValue = value;
                      });
                    },
                  ),
                ),
                Flexible(
                    child: RadioListTile(
                  title: Text(
                    '数学',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  value: '数学',
                  groupValue: _radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      _radioGroupValue = value;
                    });
                  },
                )),
                Flexible(
                    child: RadioListTile(
                  title: Text(
                    '英语',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  value: '英语',
                  groupValue: _radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      _radioGroupValue = value;
                    });
                  },
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
