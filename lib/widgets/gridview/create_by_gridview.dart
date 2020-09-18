import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';
import 'package:flutter_demo/customwidget/grid_item_widget.dart';

class CreateByGridView extends StatefulWidget {
  CreateType createType;
  Axis axis;

  CreateByGridView({@required this.createType, this.axis});

  @override
  _CreateByGridViewState createState() =>
      _CreateByGridViewState(createType: createType,axis: axis);
}

class _CreateByGridViewState extends State<CreateByGridView> {
  CreateType createType;
  Axis axis;

  _CreateByGridViewState({@required this.createType, this.axis});

  _initWidget() {
    Widget initWidget;
    switch (createType) {
      case CreateType.none:
        initWidget = GridView(
          scrollDirection: axis,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 4),
          children: <Widget>[
            GridViewItem(color: Colors.primaries[1]),
            GridViewItem(color: Colors.primaries[2]),
            GridViewItem(color: Colors.primaries[3]),
            GridViewItem(color: Colors.primaries[4]),
            GridViewItem(color: Colors.primaries[5]),
            GridViewItem(color: Colors.primaries[6]),
            GridViewItem(color: Colors.primaries[1]),
            GridViewItem(color: Colors.primaries[2]),
            GridViewItem(color: Colors.primaries[3]),
            GridViewItem(color: Colors.primaries[4]),
            GridViewItem(color: Colors.primaries[5]),
            GridViewItem(color: Colors.primaries[6]),
            GridViewItem(color: Colors.primaries[1]),
            GridViewItem(color: Colors.primaries[2]),
            GridViewItem(color: Colors.primaries[3]),
            GridViewItem(color: Colors.primaries[4]),
            GridViewItem(color: Colors.primaries[5]),
            GridViewItem(color: Colors.primaries[6]),
          ],
        );
        break;
      case CreateType.builder:
        initWidget = GridView.builder(
            itemCount: 100,
            scrollDirection: axis,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 2, crossAxisSpacing: 4),
            itemBuilder: (context, index) {
              return GridViewItem(
                  color: Colors.primaries[index % Colors.primaries.length]);
            });
        break;
      case CreateType.count:
        initWidget = GridView.count(
          scrollDirection: axis,
          crossAxisCount: 3,
          children: List.generate(100, (index) {
            return Container(
              height: 80,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }),
        );
        break;
      case CreateType.custom:
        initWidget = GridView.custom(
          scrollDirection: axis,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          childrenDelegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              height: 80,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }, childCount: 100),
        );
        break;
      case CreateType.extent:
        initWidget = GridView.extent(
          scrollDirection: axis,
          maxCrossAxisExtent: 10,
          children: List.generate(100, (index) {
            return Container(
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }),
        );
        break;
      default:
        initWidget = GridView(
          scrollDirection: axis,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 4),
          children: <Widget>[
            GridViewItem(color: Colors.primaries[1]),
            GridViewItem(color: Colors.primaries[2]),
            GridViewItem(color: Colors.primaries[3]),
            GridViewItem(color: Colors.primaries[4]),
            GridViewItem(color: Colors.primaries[5]),
            GridViewItem(color: Colors.primaries[6]),
            GridViewItem(color: Colors.primaries[1]),
            GridViewItem(color: Colors.primaries[2]),
            GridViewItem(color: Colors.primaries[3]),
            GridViewItem(color: Colors.primaries[4]),
            GridViewItem(color: Colors.primaries[5]),
            GridViewItem(color: Colors.primaries[6]),
            GridViewItem(color: Colors.primaries[1]),
            GridViewItem(color: Colors.primaries[2]),
            GridViewItem(color: Colors.primaries[3]),
            GridViewItem(color: Colors.primaries[4]),
            GridViewItem(color: Colors.primaries[5]),
            GridViewItem(color: Colors.primaries[6]),
          ],
        );
        break;
    }
    return initWidget;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (axis == null) {
      axis = Axis.vertical;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
      title: 'GridView',
      child: Column(
        children: <Widget>[
          Text(
            'createType:$createType,\nscrollDirection:$axis',
            style: TextStyle(color: Colors.blue),
          ),
          Expanded(child: _initWidget()),
        ],
      ),
    );
  }
}

enum CreateType { none, builder, custom, count, extent }
