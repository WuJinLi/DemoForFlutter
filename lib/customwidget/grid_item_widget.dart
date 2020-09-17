import 'package:flutter/material.dart';

class GridViewItem extends StatelessWidget {
  Color color;
  GridViewItem({@required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: color,
    );;
  }
}
