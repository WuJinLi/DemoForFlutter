import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';
import 'package:flutter_demo/customwidget/list_item_widget.dart';
import 'package:flutter_demo/customwidget/width_match_button_widget.dart';

class ListViewScrollController extends StatefulWidget {
  @override
  _ListViewScrollControllerState createState() =>
      _ListViewScrollControllerState();
}

class _ListViewScrollControllerState extends State<ListViewScrollController> {
  Axis _axis = Axis.vertical;
  ScrollController _scrollController;
  var _position;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _position = _scrollController.position;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
        title: 'ScrollController',
        child: Column(
          children: <Widget>[
            DescTextWidget(
                content:
                    'ScrollController 是 ListView 组件的控制器，通过 ScrollController 可以获取当前滚动的位置，也可以滚动到指定的位置'),
            WidthMatchBottonWidget(
              title: '滚动到指定位置offset=200',
              onPressed: () {
                _scrollController.animateTo(200,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear);
              },
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  '当前滑动到的index:$_position',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ))
              ],
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: _axis,
                itemBuilder: (context, index) {
                  return ListItem(
                    title: '$index',
                  );
                },
                itemCount: 20,
                itemExtent: 50,
              ),
            ),
          ],
        ));
  }
}
