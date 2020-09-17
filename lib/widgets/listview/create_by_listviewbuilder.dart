import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';
import 'package:flutter_demo/customwidget/list_item_widget.dart';

class CreateListViewByListViewBuilderWidget extends StatefulWidget {
  @override
  _CreateListViewByListViewBuilderWidgetState createState() =>
      _CreateListViewByListViewBuilderWidgetState();
}

class _CreateListViewByListViewBuilderWidgetState
    extends State<CreateListViewByListViewBuilderWidget> {
  Axis _axis = Axis.vertical;

  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
        title: 'listview.builder',
        child: Column(
          children: <Widget>[
            DescTextWidget(
                content:
                    'ListView.builder\nitemExtent 表示每一个Item的高度。\nitemCount 表示个数。'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  '调整活动方向',
                  style: TextStyle(color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
                IconButton(
                    icon: Icon(Icons.vertical_align_bottom),
                    onPressed: () {
                      setState(() {
                        _axis = Axis.vertical;
                      });
                    }),
                IconButton(
                    icon: Icon(Icons.swap_horiz),
                    onPressed: () {
                      setState(() {
                        _axis = Axis.horizontal;
                      });
                    }),
                Text(
                  '$_axis',
                  style: TextStyle(color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
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
