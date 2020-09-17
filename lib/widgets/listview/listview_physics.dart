import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';
import 'package:flutter_demo/customwidget/list_item_widget.dart';
import 'package:flutter_demo/customwidget/width_match_button_widget.dart';

class ListViewPhysicsWidget extends StatefulWidget {
  @override
  _ListViewPhysicsWidgetState createState() => _ListViewPhysicsWidgetState();
}

class _ListViewPhysicsWidgetState extends State<ListViewPhysicsWidget> {
  ScrollPhysics _scrollPhysics = AlwaysScrollableScrollPhysics();

  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
        title: 'physics',
        child: Column(
          children: <Widget>[
            DescTextWidget(
                content: 'physics(ScrollPhysics): 参数表示当滚动到顶部或者底部时滚动的物理特性'),
            DescTextWidget(
              content:
                  'AlwaysScrollableScrollPhysics：总是可以滑动\nNeverScrollableScrollPhysics：禁止滚动\nBouncingScrollPhysics ：内容超过一屏 上拉有回弹效果\nClampingScrollPhysics ：包裹内容 不会有回弹',
            ),
            WidthMatchBottonWidget(
                title: 'AlwaysScrollableScrollPhysics',
                onPressed: () {
                  setState(() {
                    _scrollPhysics = AlwaysScrollableScrollPhysics();
                  });
                }),
            WidthMatchBottonWidget(
                title: 'NeverScrollableScrollPhysics',
                onPressed: () {
                  setState(() {
                    _scrollPhysics = NeverScrollableScrollPhysics();
                  });
                }),
            WidthMatchBottonWidget(
                title: 'BouncingScrollPhysics',
                onPressed: () {
                  setState(() {
                    _scrollPhysics = BouncingScrollPhysics();
                  });
                }),
            WidthMatchBottonWidget(
                title: 'ClampingScrollPhysics',
                onPressed: () {
                  setState(() {
                    _scrollPhysics = ClampingScrollPhysics();
                  });
                }),
            Expanded(
              child: ListView.builder(
                physics: _scrollPhysics,
                scrollDirection: Axis.horizontal,
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
