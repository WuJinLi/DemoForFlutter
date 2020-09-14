import 'package:flutter/material.dart';

class TextWidgetPage extends StatefulWidget {
  @override
  _TextWidgetPageState createState() => _TextWidgetPageState();
}

class _TextWidgetPageState extends State<TextWidgetPage> {
  double _fontSize = 12.0;
  Color _fontColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('text'),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  '字体大小：',
                  style: TextStyle(fontSize: 18.0),
                ),
                RaisedButton(
                  color: Colors.white,
                  child: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if(_fontSize>0.0){
                        _fontSize--;
                      }
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    '$_fontSize',
                    textAlign: TextAlign.center,
                  ),
                ),
                RaisedButton(
                    color: Colors.white,
                    child: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        _fontSize++;
                      });
                    }),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  '字体颜色：',
                  style: TextStyle(fontSize: 18.0),
                ),
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.white,
                        child: Text(
                          '蓝色',
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () {
                          setState(() {
                            _fontColor = Colors.blue;
                          });
                        },
                      ),
                      RaisedButton(
                        color: Colors.white,
                        child: Text(
                          '红色',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          setState(() {
                            _fontColor = Colors.red;
                          });
                        },
                      ),
                      RaisedButton(
                        color: Colors.white,
                        child: Text(
                          '绿色',
                          style: TextStyle(color: Colors.green),
                        ),
                        onPressed: () {
                          setState(() {
                            _fontColor = Colors.green;
                          });
                        },
                      ),
                      RaisedButton(
                        color: Colors.white,
                        child: Text(
                          '黄色',
                          style: TextStyle(color: Colors.orange),
                        ),
                        onPressed: () {
                          setState(() {
                            _fontColor = Colors.orange;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Text(
                  'hello flutter',
                  style: TextStyle(fontSize: _fontSize, color: _fontColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
