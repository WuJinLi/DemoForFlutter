import 'package:flutter/material.dart';
import 'constant /main_body_data.dart';
import 'customwidget/main_page_gridview_item.dart';

// ignore: must_be_immutable
class MainPageBody extends StatelessWidget {
  List<MainPageBodyData> list;

  MainPageBody({
    Key key,
    @required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        padding: EdgeInsets.all(5.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemBuilder: (context, index) {
          return MainPageGridViewItem(
            data: list[index],
          );
        },
        itemCount: list?.length,
      ),
    );
  }
}
