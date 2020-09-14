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
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Builder(
          builder: (BuildContext context) {
            return Column(
              children: <Widget>[
                RichText(
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
                        style:
                            TextStyle(color: Colors.cyanAccent, fontSize: 30.0),
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
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <InlineSpan>[
                        TextSpan(text: 'RichText实现方式：已阅读并同意 '),
                        TextSpan(
                            text: '《************协议》',
                            style: TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '************协议',
                                    ),
                                  ),
                                );
                              }),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 10, 0.0, 0.0),
                  child: Text.rich(
                    TextSpan(children: <InlineSpan>[
                      TextSpan(text: 'Text.rich实现方式：已阅读并同意 '),
                      TextSpan(
                          text: '《************协议》',
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '************协议',
                                  ),
                                ),
                              );
                            }),
                    ]),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
