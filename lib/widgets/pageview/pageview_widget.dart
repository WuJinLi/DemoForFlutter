import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';
import 'package:toast/toast.dart';

class PageViewWidget extends StatefulWidget {
  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  Axis _axis = Axis.horizontal;
  int _currentIndex = 0;

  _rowScrollWidgets() {
    return Row(
      children: <Widget>[
        Expanded(
          child: MaterialButton(
            child: Text(
              'horizontal',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            color: Colors.blue,
            onPressed: () {
              setState(() {
                _axis = Axis.horizontal;
              });
            },
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: MaterialButton(
            child: Text(
              'vertical',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            color: Colors.blue,
            onPressed: () {
              setState(() {
                _axis = Axis.vertical;
              });
            },
          ),
        ),
      ],
    );
  }

  _pageviewShowWidget() {
    return Container(
      height: 200,
      child: PageView(
          scrollDirection: _axis,
          controller: PageController(viewportFraction: 1, initialPage: 2),
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: List.generate(5, (index) {
            return ItemPage(
              title: 'pageview$index',
              color: Colors.primaries[index % Colors.primaries.length],
            );
          })),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
        title: 'pageView',
        child: Column(
          children: <Widget>[
            DescTextWidget(
                content: 'PageView属性scrollDirection设置滚动方向，默认是水平，可以设置其为垂直方向'),
            _rowScrollWidgets(),
            _pageviewShowWidget(),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              child: Text(
                '当前index:$_currentIndex',
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),
            ),
            DescTextWidget(
                content:
                    'PageView配合PageController可以实现非常酷炫的效果\nviewportFraction:设置屏占比\ninitialPage:表示当前加载第几页,默认第一页\nonPageChanged:是页面发生变化时的回调'),
          ],
        ));
  }
}

class ItemPage extends StatelessWidget {
  Color color = Colors.blue;
  String title;

  ItemPage({@required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: color,
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }
}
