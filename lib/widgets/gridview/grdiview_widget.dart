import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/width_match_button_widget.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/route_animaton/page_route_animation.dart';
import 'package:flutter_demo/widgets/gridview/create_by_gridview.dart';
import 'package:flutter_demo/widgets/gridview/gridview_scroll.dart';

class GridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
        title: 'gridview',
        child: Column(
          children: <Widget>[
            WidthMatchBottonWidget(
                title: 'GridView',
                onPressed: () {
                  Navigator.of(context)
                      .push(PageRouteAnimation(widget: CreateByGridView()));
                }),WidthMatchBottonWidget(
                title: 'scrollDirection',
                onPressed: () {
                  Navigator.of(context)
                      .push(PageRouteAnimation(widget: GridViewScrollDirection()));
                }),
          ],
        ));
  }
}
