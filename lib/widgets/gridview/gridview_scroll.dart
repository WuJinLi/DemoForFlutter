import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';
import 'package:flutter_demo/customwidget/grid_item_widget.dart';

class GridViewScrollDirection extends StatefulWidget {
  @override
  _GridViewScrollDirectionState createState() =>
      _GridViewScrollDirectionState();
}

class _GridViewScrollDirectionState extends State<GridViewScrollDirection> {
  bool offstage = false;

  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
      title: 'GridView',
      child: Column(
        children: <Widget>[
          DescTextWidget(
            content: 'scrollDirection 表示滚动方向，默认是垂直方向，可以设置为水平方向。',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.vertical_align_bottom),
                onPressed: () {
                  offstage = false;
                },
              ),
              IconButton(
                icon: Icon(Icons.swap_horiz),
                onPressed: () {
                  offstage = true;
                },
              ),
            ],
          ),
          // Offstage(
          //   offstage: offstage,
          Expanded(
            child: GridView(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
              children: <Widget>[
                GridViewItem(color: Colors.primaries[0]),
                GridViewItem(color: Colors.primaries[1]),
                GridViewItem(color: Colors.primaries[2]),
                GridViewItem(color: Colors.primaries[3]),
                GridViewItem(color: Colors.primaries[4]),
                GridViewItem(color: Colors.primaries[5]),
                GridViewItem(color: Colors.primaries[6]),
                GridViewItem(color: Colors.primaries[7]),
                GridViewItem(color: Colors.primaries[8]),
                GridViewItem(color: Colors.primaries[9]),
                GridViewItem(color: Colors.primaries[10]),
                GridViewItem(color: Colors.primaries[11]),
                GridViewItem(color: Colors.primaries[12]),
                GridViewItem(color: Colors.primaries[13]),
              ],
            ),
            // ),
          ),
          Offstage(
            offstage: !offstage,
            child: Expanded(
              child: GridView(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
                children: <Widget>[
                  GridViewItem(color: Colors.primaries[0]),
                  GridViewItem(color: Colors.primaries[1]),
                  GridViewItem(color: Colors.primaries[2]),
                  GridViewItem(color: Colors.primaries[3]),
                  GridViewItem(color: Colors.primaries[4]),
                  GridViewItem(color: Colors.primaries[5]),
                  GridViewItem(color: Colors.primaries[6]),
                  GridViewItem(color: Colors.primaries[7]),
                  GridViewItem(color: Colors.primaries[8]),
                  GridViewItem(color: Colors.primaries[9]),
                  GridViewItem(color: Colors.primaries[10]),
                  GridViewItem(color: Colors.primaries[11]),
                  GridViewItem(color: Colors.primaries[12]),
                  GridViewItem(color: Colors.primaries[13]),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
