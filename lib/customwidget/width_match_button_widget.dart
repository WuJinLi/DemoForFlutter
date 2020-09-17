import 'package:flutter/material.dart';

class WidthMatchBottonWidget extends StatelessWidget {
  String title;
  var onPressed;

  WidthMatchBottonWidget({@required this.title, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: MaterialButton(
            color: Colors.blue,
            height: 40,
            child: Text(
              '$title',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
