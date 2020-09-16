import 'package:flutter/material.dart';

import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';

class StackLayout extends StatefulWidget {
  @override
  _StackLayoutState createState() => _StackLayoutState();
}

class _StackLayoutState extends State<StackLayout> {
  StackFit _fit = StackFit.loose;
  AlignmentDirectional _alignment = AlignmentDirectional.topStart;
  double _left = 0.0;
  double _right = 0.0;
  double _top = 0.0;
  double _bottom = 0.0;
  int _index = 0;

  _buildIndexedStack() {
    return IndexedStack(
      index: _index,
      children: <Widget>[
        Center(
          child: Container(
            height: 200,
            width: 200,
            color: Colors.lightBlueAccent,
            alignment: Alignment.center,
            child:
                Text('0', style: TextStyle(color: Colors.white, fontSize: 15)),
          ),
        ),
        Center(
          child: Container(
            height: 200,
            width: 200,
            color: Colors.lightBlue,
            alignment: Alignment.center,
            child:
                Text('1', style: TextStyle(color: Colors.white, fontSize: 15)),
          ),
        ),
        Center(
          child: Container(
            height: 200,
            width: 200,
            color: Colors.lightGreenAccent,
            alignment: Alignment.center,
            child:
                Text('2', style: TextStyle(color: Colors.white, fontSize: 15)),
          ),
        ),
      ],
    );
  }

  _buildRow() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.lightBlueAccent, width: 1, style: BorderStyle.solid),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RaisedButton(
            color: Colors.lightBlueAccent,
            child:
                Text('0', style: TextStyle(color: Colors.white, fontSize: 15)),
            onPressed: () {
              setState(() {
                _index = 0;
              });
            },
          ),
          RaisedButton(
            color: Colors.lightBlue,
            child:
                Text('1', style: TextStyle(color: Colors.white, fontSize: 15)),
            onPressed: () {
              setState(() {
                _index = 1;
              });
            },
          ),
          RaisedButton(
            color: Colors.lightGreenAccent,
            child: Text(
              '2',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            onPressed: () {
              setState(() {
                _index = 2;
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
        centerTitle: true,
      ),
      body: PageBaseWidget(
        layout: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          reverse: false,
          child: Column(
            children: <Widget>[
              DescTextWidget(content: 'Stack: \n组件将子组件叠加显示，根据子组件的顺利依次向上叠加'),
              StackLayoutShowWidget(
                alignment: AlignmentDirectional.topStart,
              ),
              DescTextWidget(
                  content:
                      'Stack 对未定位（不被 Positioned 包裹）子组件的大小由 fit 参数决定，默认值是 StackFit.loose ，表示子组件自己决定，StackFit.expand 表示尽可能的大'),
              DescTextWidget(
                  content:
                      'Stack 对未定位（不被 Positioned 包裹）子组件的对齐方式由 alignment 控制，默认左上角对齐\nStack-Alignment:'),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        _alignment = AlignmentDirectional.topStart;
                      });
                    },
                    child: Text('topStart'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        _alignment = AlignmentDirectional.topCenter;
                      });
                    },
                    child: Text('topCenter'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        _alignment = AlignmentDirectional.topEnd;
                      });
                    },
                    child: Text('topEnd'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        _alignment = AlignmentDirectional.centerStart;
                      });
                    },
                    child: Text('centerStart'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        _alignment = AlignmentDirectional.center;
                      });
                    },
                    child: Text('center'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        _alignment = AlignmentDirectional.centerEnd;
                      });
                    },
                    child: Text('centerEnd'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        _alignment = AlignmentDirectional.bottomStart;
                      });
                    },
                    child: Text('bottomStart'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        _alignment = AlignmentDirectional.bottomCenter;
                      });
                    },
                    child: Text('bottomCenter'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        _alignment = AlignmentDirectional.bottomEnd;
                      });
                    },
                    child: Text('bottomEnd'),
                  ),
                ],
              ),
              StackLayoutShowWidget(
                alignment: _alignment,
              ),
              DescTextWidget(content: 'Stack-Positioned实现定位:'),
              TextField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'left',
                ),
                onChanged: (value) {
                  setState(() {
                    _left = double.parse(value);
                  });
                },
              ),
              TextField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'right',
                ),
                onChanged: (value) {
                  setState(() {
                    _right = double.parse(value);
                  });
                },
              ),
              TextField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'top',
                ),
                onChanged: (value) {
                  setState(() {
                    _top = double.parse(value);
                  });
                },
              ),
              TextField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'bottom',
                  fillColor: Colors.grey[200],
                ),
                onChanged: (value) {
                  setState(() {
                    _bottom = double.parse(value);
                  });
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey, width: 1, style: BorderStyle.solid),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 150,
                      color: Colors.blue,
                      child: Text(
                        '1',
                        style: TextStyle(color: Colors.white),
                      ),
                      alignment: Alignment.bottomRight,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.orangeAccent,
                      child: Text(
                        '2',
                        style: TextStyle(color: Colors.white),
                      ),
                      alignment: Alignment.bottomRight,
                    ),
                    Positioned(
                      top: _top,
                      bottom: _bottom,
                      left: _left,
                      right: _right,
                      child: Container(
                        color: Colors.greenAccent,
                        child: Text(
                          '3',
                          style: TextStyle(color: Colors.white),
                        ),
                        alignment: Alignment.bottomRight,
                      ),
                    )
                  ],
                ),
              ),
              DescTextWidget(content: '如果子组件超过 Stack 边界由 overflow 控制，默认是裁剪'),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.lightBlueAccent,
                      width: 1,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                width: double.infinity,
                height: 300,
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                      child: Text(
                        '1',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Positioned(
                      left: 50,
                      top: 50,
                      height: 150,
                      width: 150,
                      child: Container(
                        child: Text(
                          '2',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
              DescTextWidget(content: 'IndexedStack'),
              DescTextWidget(
                content:
                    'IndexedStack 是 Stack 的子类，Stack 是将所有的子组件叠加显示，而 IndexedStack 通过 index 只显示指定索引的子组件',
              ),
              SizedBox(
                height: 50,
              ),
              _buildIndexedStack(),
              SizedBox(
                height: 30,
              ),
              _buildRow(),
            ],
          ),
        ),
      ),
    );
  }
}

class StackLayoutShowWidget extends StatelessWidget {
  AlignmentDirectional alignment = AlignmentDirectional.topStart;

  StackLayoutShowWidget({this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey[200], width: 1.0, style: BorderStyle.solid),
      ),
      child: Stack(
        alignment: alignment,
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            color: Colors.green,
            child: Text(
              '1',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            alignment: Alignment.bottomRight,
          ),
          Container(
            width: 150,
            height: 150,
            color: Colors.orangeAccent,
            child: Text(
              '2',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            alignment: Alignment.bottomRight,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            child: Text(
              '3',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            alignment: Alignment.bottomRight,
          ),
        ],
      ),
    );
  }
}
