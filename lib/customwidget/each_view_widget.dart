import 'package:flutter/material.dart';

class EachViewWidge extends StatelessWidget {
  String content;

  EachViewWidge({@required this.content});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        this.content,
        style: TextStyle(color: Colors.cyanAccent[100], fontSize: 16.0),
      ),
    );
  }
}
