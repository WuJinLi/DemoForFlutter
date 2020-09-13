import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWidgetPage extends StatelessWidget {
  const TextWidgetPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('text'),
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '过渡颜色的文字案例:',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.lightBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
            Builder(
              builder: (BuildContext context) {
                RenderBox box = context.findRenderObject();
                final Shader linearGradient = LinearGradient(
                  colors: <Color>[Colors.purple, Colors.blue],
                ).createShader(Rect.fromLTWH(
                    0.0, 0.0, box?.size?.width, box?.size?.height));

                return Text(
                  'Flutter技术和应用实战',
                  style: new TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient),
                );
              },
            ),
            Text.rich(
              TextSpan(
                  text: '登录即代表同意并阅读',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF999999),
                  ),
                  children: [
                    TextSpan(
                        text: '《服务协议》',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('onTap');
                          }),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
