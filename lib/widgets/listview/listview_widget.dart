import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/each_view_widget.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';
import 'package:flutter_demo/customwidget/width_match_button_widget.dart';
import 'package:flutter_demo/route_animaton/page_route_animation.dart';
import 'package:flutter_demo/widgets/listview/create_by_listview.dart';
import 'package:flutter_demo/widgets/listview/create_by_listviewbuilder.dart';
import 'package:flutter_demo/widgets/listview/create_by_listViewseparated.dart';
import 'listview_scrollcontroller.dart';
import 'listview_physics.dart';

class ListViewWidget extends StatefulWidget {
  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('listview'),
        centerTitle: true,
      ),
      body: PageBaseWidget(
        layout: Column(
          children: <Widget>[
            WidthMatchBottonWidget(
                title: 'ListView',
                onPressed: () {
                  Navigator.of(context).push(PageRouteAnimation(
                      widget: CreateByListViewWidget(),
                      animationType: AnimationType.FADETRANSITIONTYPE));
                }),
            WidthMatchBottonWidget(
                title: 'ListView.builder',
                onPressed: () {
                  Navigator.of(context).push(PageRouteAnimation(
                      widget: CreateListViewByListViewBuilderWidget(),
                      animationType: AnimationType.SCALETRANSITIONTYPE));
                }),
            WidthMatchBottonWidget(
                title: 'ListView.separated',
                onPressed: () {
                  Navigator.of(context).push(PageRouteAnimation(
                      widget: CreateListViewByListViewSeparatedWidget(),
                      animationType: AnimationType.SCALETRANSITIONTYPE));
                }),
            WidthMatchBottonWidget(
                title: 'ScrollController',
                onPressed: () {
                  Navigator.of(context).push(PageRouteAnimation(
                      widget: ListViewScrollController(),
                      animationType: AnimationType.SLIDETRANSITIONTYPE));
                }),
            WidthMatchBottonWidget(
                title: 'ScrollPhysics',
                onPressed: () {
                  Navigator.of(context).push(PageRouteAnimation(
                      widget: ListViewPhysicsWidget(),
                      animationType: AnimationType.SLIDETRANSITIONTYPE));
                }),
          ],
        ),
      ),
    );
  }
}
