import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';
import 'package:flutter_demo/customwidget/grid_item_widget.dart';

class CreateByGridView extends StatefulWidget {
  @override
  _CreateByGridViewState createState() => _CreateByGridViewState();
}

class _CreateByGridViewState extends State<CreateByGridView> {
  Axis _axi = Axis.vertical;

  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
      title: 'GridView',
      child: SingleChildScrollView(
        scrollDirection: _axi,
        reverse: false,
        child: Column(
          children: <Widget>[
            DescTextWidget(
                content:
                    'gridDelegate参数控制子控件的排列，有2个选择\nSliverGridDelegateWithFixedCrossAxisCount：交叉轴方向上固定数量，对于垂直方向的GridView来说交叉轴方向指的是水平方向\nSliverGridDelegateWithMaxCrossAxisExtent：交叉轴方向上尽量大，比如水平方上有500空间，指定此值为150，那么可以放3个，剩余一些空间，此时GridView将会缩小每一个Item，放置4个。'),
            Container(
              width: double.infinity,
              height: 400,
              child: GridView(
                scrollDirection: _axi,
                shrinkWrap: true,
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
                ],
              ),
            ),
            DescTextWidget(
                content:
                    'SliverGridDelegateWithFixedCrossAxisCount有属性介绍如下：\ncrossAxisCount：交叉轴方向上个数。\nmainAxisSpacing：主轴方向上2行之间的间隔。\ncrossAxisSpacing：交叉轴方向上之间的间隔。\nchildAspectRatio：子控件宽高比。'),
          ],
        ),
      ),
    );
  }
}
