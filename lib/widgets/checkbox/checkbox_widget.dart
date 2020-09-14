import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';

class CheckBoxWidget extends StatefulWidget {
  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  var __checkValueForCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('checkox'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            DescTextWidget(
                content: 'Checkbox是勾选框控件，本身不包含任何状态，改变状态需要通过改变value的值改变'),
            DescTextWidget(
                content:
                    'value值为bool类型，true表示选择状态;\nonChanged为发生变化时回调，即点击控件时回调，方法内的参数为新的值;\nactiveColor为激活状态下颜色，是矩形区域内的颜色，checkColor是选中后“对勾”的颜色;'),
            Row(
              children: <Widget>[
                Expanded(
                    child: Checkbox(
                        checkColor: Colors.cyanAccent,
                        value: __checkValueForCheckBox,
                        onChanged: (value) {
                          setState(() {
                            Toast.show('$value', context);
                            __checkValueForCheckBox = value;
                          });
                        }))
              ],
            ),
            DescTextWidget(content: 'CheckboxListTile:\nCheckboxListTile默认是充满父组件的，因此需要Container限制其宽度'),
            DescTextWidget(content: 'ListTileControlAffinity:勾选框位置'),
            Row(
              children: <Widget>[
                Expanded(
                  child: CheckboxListTile(
                    title: Text('learn flutter'),
                    value: __checkValueForCheckBox,
                    controlAffinity: ListTileControlAffinity.leading,
                    subtitle: Text('hello flutter'),
                    secondary: Icon(Icons.help),
                    onChanged: (value) {
                      setState(() {
                        __checkValueForCheckBox = value;
                      });
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
