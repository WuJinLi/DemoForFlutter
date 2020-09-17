import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';
import 'package:flutter_demo/customwidget/list_item_widget.dart';

class CreateByListViewWidget extends StatefulWidget {
  @override
  _CreateByListViewWidgetState createState() => _CreateByListViewWidgetState();
}

class _CreateByListViewWidgetState extends State<CreateByListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
        title: 'listview create by listView ',
        child: Column(
          children: <Widget>[
            DescTextWidget(
                content: 'ListView 是滚动组件，常用组件之一,数据较少时使用ListView组件创建'),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  ListItem(
                    title: '1',
                  ),
                  ListItem(
                    title: '2',
                  ),
                  ListItem(
                    title: '3',
                  ),
                  ListItem(
                    title: '4',
                  ),
                  ListItem(
                    title: '5',
                  ),
                  ListItem(
                    title: '6',
                  ),
                  ListItem(
                    title: '7',
                  ),
                  ListItem(
                    title: '8',
                  ),
                  ListItem(
                    title: '9',
                  ),
                  ListItem(
                    title: '10',
                  ),
                  ListItem(
                    title: '11',
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
