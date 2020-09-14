import 'package:flutter/material.dart';

class DescTextWidget extends StatelessWidget {
  String content;

  DescTextWidget({@required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            '$content',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.lightBlueAccent,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}
