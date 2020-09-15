import 'package:flutter/material.dart';

class DescTextWidget extends StatelessWidget {
  String content;

  DescTextWidget({@required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Row(
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
      ),
    );
  }
}
