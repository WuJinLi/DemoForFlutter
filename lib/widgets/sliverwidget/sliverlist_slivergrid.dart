import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';

class SliverListAndSliverGrid extends StatefulWidget {
  @override
  _SliverListAndSliverGridState createState() =>
      _SliverListAndSliverGridState();
}

class _SliverListAndSliverGridState extends State<SliverListAndSliverGrid> {
  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
        title: 'SliverListView/SliverGridView',
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  color: Colors.primaries[index % Colors.primaries.length],
                  height: 65,
                );
              }, childCount: 5),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 3),
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  color: Colors.primaries[index % Colors.primaries.length],
                );
              }, childCount: 20),
            )
          ],
        ));
  }
}
