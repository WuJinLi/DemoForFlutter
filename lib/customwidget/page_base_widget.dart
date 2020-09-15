import 'package:flutter/material.dart';

class PageBaseWidget extends StatelessWidget {
  Widget layout;

  PageBaseWidget({@required this.layout});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: layout,
    );
  }
}
