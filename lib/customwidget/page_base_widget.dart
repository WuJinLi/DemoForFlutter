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

class PageBaseContainScaffoldWidget extends StatelessWidget {
  String title;
  Widget child;

  PageBaseContainScaffoldWidget({@required this.title, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: child,
      ),
    );
  }
}
