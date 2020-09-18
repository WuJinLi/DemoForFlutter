import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/width_match_button_widget.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/route_animaton/page_route_animation.dart';
import 'package:flutter_demo/widgets/gridview/create_by_gridview.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';

class GridViewWidget extends StatefulWidget {
  @override
  _GridViewWidgetState createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  CreateType createType;
  Axis axis = Axis.vertical;

  _createType() {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
          color: Colors.lightGreenAccent,
          child: Text(
            'none',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          onPressed: () {
            setState(() {
              createType = CreateType.none;
            });
          },
        ),
        RaisedButton(
          color: Colors.lightGreenAccent,
          child: Text(
            'builder',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          onPressed: () {
            setState(() {
              createType = CreateType.builder;
            });
          },
        ),
        RaisedButton(
          color: Colors.lightGreenAccent,
          child: Text(
            'custom',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          onPressed: () {
            setState(() {
              createType = CreateType.custom;
            });
          },
        ),
        RaisedButton(
          color: Colors.lightGreenAccent,
          child: Text(
            'count',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          onPressed: () {
            setState(() {
              createType = CreateType.count;
            });
          },
        ),
        RaisedButton(
          color: Colors.lightGreenAccent,
          child: Text(
            'extent',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          onPressed: () {
            setState(() {
              createType = CreateType.extent;
            });
          },
        ),
      ],
    );
  }

  _initScrollDirection() {
    return Column(
      children: <Widget>[
        WidthMatchBottonWidget(
            title: 'vertical',
            onPressed: () {
              setState(() {
                axis = Axis.vertical;
              });
            }),
        WidthMatchBottonWidget(
            title: 'horizontal',
            onPressed: () {
              setState(() {
                axis = Axis.horizontal;
              });
            })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
        title: 'gridview',
        child: Column(
          children: <Widget>[
            DescTextWidget(content: 'gridview创建方式：'),
            _createType(),
            DescTextWidget(content: 'gridview滑动方向：'),
            _initScrollDirection(),
            DescTextWidget(content: 'gridview创建查看：'),
            Text(
              '已选：\ncreateType:$createType,\nscrollDirection:$axis',
              style: TextStyle(color: Colors.blue),
            ),
            WidthMatchBottonWidget(
                title: 'GridView',
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteAnimation(
                      widget: CreateByGridView(
                        createType: createType,
                        axis: axis,
                      ),
                      animationType: AnimationType.SCALETRANSITIONTYPE,
                    ),
                  );
                }),
          ],
        ));
  }
}
