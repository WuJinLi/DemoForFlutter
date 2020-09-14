import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextWidgetPage extends StatefulWidget {
  @override
  _RichTextWidgetPageState createState() => _RichTextWidgetPageState();
}

class _RichTextWidgetPageState extends State<RichTextWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('RichText'),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <InlineSpan>[
                  TextSpan(
                    text: 'hello flutter',
                    style: TextStyle(color: Colors.orange, fontSize: 30.0),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('orange'),
                          ),
                        );
                      },
                  ),
                  TextSpan(
                    text: '    hello flutter',
                    style: TextStyle(color: Colors.green, fontSize: 30.0),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('green'),
                          ),
                        );
                      },
                  ),
                  TextSpan(
                    text: '    flutter hello',
                    style: TextStyle(color: Colors.cyanAccent, fontSize: 30.0),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('cyanAccent'),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
