import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';
import 'package:flutter_demo/customwidget/list_item_widget.dart';

class CreateListViewByListViewSeparatedWidget extends StatefulWidget {
  @override
  _CreateListViewByListViewSeparatedWidgetState createState() =>
      _CreateListViewByListViewSeparatedWidgetState();
}

class _CreateListViewByListViewSeparatedWidgetState
    extends State<CreateListViewByListViewSeparatedWidget> {
  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
        title: 'ListView.separated',
        child: Column(
          children: <Widget>[
            DescTextWidget(content: 'ListView.separated:\n在每一项中间增加分割线可以使用如下'),
            Expanded(
                child: ListView.separated(
              itemBuilder: (context, index) {
                return ListItem(
                  title: '$index',
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.lightGreenAccent,
                  height: 2,
                );
              },
              itemCount: 20,
            ))
          ],
        ));
  }
}
