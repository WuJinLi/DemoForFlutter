import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';
import 'package:flutter_demo/customwidget/width_match_button_widget.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter/cupertino.dart';

class DialogWidget extends StatefulWidget {
  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _showWidget(context, type) {
    switch (type) {
      case DialogType.alertDialog:
        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('提示'),
                content: Text('确认删除吗？'),
                actions: [
                  FlatButton(
                    child: Text('取消'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text('确认'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      case DialogType.cupertinoAlertDialog:
        return showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text('提示'),
                content: Text('确认删除吗？'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('取消'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text('确认'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });

      case DialogType.simpleDialog:
        return showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                title: Text('提示'),
                children: <Widget>[
                  Container(
                    height: 80,
                    alignment: Alignment.center,
                    child: Text('确认删除吗？'),
                  ),
                  Divider(
                    height: 1,
                  ),
                  FlatButton(
                    child: Text('取消'),
                    onPressed: () {
                      Navigator.of(context).pop('cancel');
                    },
                  ),
                  Divider(
                    height: 1,
                  ),
                  FlatButton(
                    child: Text('确认'),
                    onPressed: () {
                      Navigator.of(context).pop('ok');
                    },
                  ),
                ],
              );
            });

      case DialogType.dialog:
        return showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: CustomDialog(),
              );
            });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
      title: 'dialog',
      child: Column(
        children: [
          DescTextWidget(
              content: 'alertDialog /cupertinoAlertDialog/simpleDialog/Dialog'),
          WidthMatchBottonWidget(
              title: 'alertDialog',
              onPressed: () {
                _showWidget(context, DialogType.alertDialog);
              }),
          WidthMatchBottonWidget(
              title: 'cupertinoAlertDialog',
              onPressed: () {
                _showWidget(context, DialogType.cupertinoAlertDialog);
              }),
          WidthMatchBottonWidget(
              title: 'simpleDialog',
              onPressed: () {
                _showWidget(context, DialogType.simpleDialog);
              }),
          WidthMatchBottonWidget(
              title: 'dialog',
              onPressed: () {
                _showWidget(context, DialogType.dialog);
              }),
          DescTextWidget(
              content:
                  'showDialog和AlertDialog配合使用展示Material风格对话框，showCupertinoDialog和CupertinoAlertDialog配合使用展示iOS风格对话框，showCupertinoDialog点击空白处是无法退出对话框的，而showDialog点击空白处默认退出对话框，barrierDismissible属性控制点击空白处的行为'),
          DescTextWidget(
              content:
                  '如果你觉得这还是不够个性，那可以祭出终极大招了，直接使用Dialog，Dialog可以定制任何对话框，只需将对话框的内容给child属性'),
        ],
      ),
    );
  }
}

enum DialogType { alertDialog, cupertinoAlertDialog, simpleDialog, dialog }

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200], width: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      width: 300,
      height: 200,
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  '提示',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue, fontSize: 18.0),
                ))
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          Container(
            height: 90,
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  '确认删除吗？',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue, fontSize: 18.0),
                ))
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          Container(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      '取消',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 18.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: 1.0,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      '确认',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blue, fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
