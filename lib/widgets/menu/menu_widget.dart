import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/width_match_button_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';

class MenuWidget extends StatefulWidget {
  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  var result;
  var resultFlag;
  var resultShow;

  List<PopupMenuEntry<String>> _popMenu() {
    return List.generate(10, (index) {
      return PopupMenuItem(
        child: Text('$index'),
        value: '$index',
        textStyle: TextStyle(color: Colors.blue),
      );
    });
  }

  List<PopupMenuEntry<String>> _popMenuHasFlag() {
    return List.generate(10, (index) {
      return CheckedPopupMenuItem(
        value: '$index',
        checked: index == 0 ? true : false,
        child: Text('$index'),
      );
    });
  }

  _popMenuView(TypeOfMenu type) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            type == TypeOfMenu.normal
                ? (result == null ? '0' : '$result')
                : (resultFlag == null ? '0' : '$resultFlag'),
            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
        ),
        PopupMenuButton<String>(
          itemBuilder: (context) {
            if (type == TypeOfMenu.normal) {
              return _popMenu();
            } else if (type == TypeOfMenu.hasFlag) {
              return _popMenuHasFlag();
            }
          },
          initialValue: '0',
          tooltip: 'PopupMenuButton',
          elevation: 0,
          onSelected: (value) {
            setState(() {
              if (type == TypeOfMenu.normal) {
                result = value;
              } else {
                resultFlag = value;
              }
            });
          },
          onCanceled: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
      title: '弹出菜单',
      child: Column(
        children: <Widget>[
          DescTextWidget(content: 'PopupMenuItem:'),
          _popMenuView(TypeOfMenu.normal),
          SizedBox(
            height: 10,
          ),
          DescTextWidget(content: 'CheckedPopupMenuItem:'),
          _popMenuView(TypeOfMenu.hasFlag),
          DescTextWidget(content: 'showMenu'),
          WidthMatchBottonWidget(
            title: 'showMenu',
            onPressed: () async {
              var result = await showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(0.0, 300.0, 0.0, 0.0),
                  items: _popMenu(),
                  initialValue: '0');

              setState(() {
                resultShow = result;
              });
            },
          ),
          DescTextWidget(content: 'showMenu:$resultShow'),
        ],
      ),
    );
  }
}

enum TypeOfMenu { normal, hasFlag }
