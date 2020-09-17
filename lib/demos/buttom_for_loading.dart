import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';

class ButtomForLodaing extends StatefulWidget {
  @override
  _ButtomForLodaingState createState() => _ButtomForLodaingState();
}

class _ButtomForLodaingState extends State<ButtomForLodaing> {
  ButtomStatus _buttomStatus = ButtomStatus.none;
  String showContent = '未加载';

  //根据当前的加载状态来确定对应状态下的组件展示
  _buildChild() {
    if (_buttomStatus == ButtomStatus.none) {
      return Text(
        '登  录',
        style: TextStyle(color: Colors.white, fontSize: 28),
      );
    } else if (_buttomStatus == ButtomStatus.loading) {
      return CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 2,
      );
    } else if (_buttomStatus == ButtomStatus.done) {
      return Icon(
        Icons.done,
        color: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('buttom for loading'),
        centerTitle: true,
      ),
      body: PageBaseWidget(
          layout: Column(
        children: <Widget>[
          DescTextWidget(content: '$showContent'),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            child: MaterialButton(
              color: Colors.blue,
              minWidth: 240,
              height: 50,
              onPressed: () {
                setState(() {
                  _buttomStatus = ButtomStatus.loading;
                  showContent = '加载中';
                  Future.delayed(Duration(seconds: 2), () {
                    setState(() {
                      _buttomStatus = ButtomStatus.done;
                      showContent = '加载完成';
                    });
                  });
                });
              },
              child: _buildChild(),
            ),
          ),
        ],
      )),
    );
  }
}

enum ButtomStatus { none, loading, done }
