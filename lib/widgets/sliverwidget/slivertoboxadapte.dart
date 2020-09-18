import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';

class SliverToBoxAdapteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: DescTextWidget(
                content:
                    '在使用CustomScrollView创建自定义滚动效果的时候，CustomScrollView只能包含sliver系列组件，如果包含普通的组件则使用SliverToBoxAdapter包裹'),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.blue[200],
              height: 100,
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                '这是SliverToBoxAdapter包裹的普通的widget在CustomScrollView展示的内容',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                color: Colors.primaries[index % Colors.primaries.length],
              );
            }, childCount: 6),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 2),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 50,
                  color: Colors.primaries[index % Colors.primaries.length],
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
