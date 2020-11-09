import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/route_animaton/page_route_animation.dart';

class RouteStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
      child: new Container(
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteAnimation(
                  widget: BPage(
                    content: 'A->B',
                  ),
                  animationType: AnimationType.ROTATIONTRANSITIONTYPE),
            );
          },
          child: Text('Page A'),
        ),
      ),
      title: 'routeStack',
    );
  }
}

class BPage extends StatelessWidget {
  String content;

  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
      child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteAnimation(
                        widget: CPage(
                          content: 'A->B->C',
                        ),
                        animationType: AnimationType.FADETRANSITIONTYPE),
                  );
                },
                child: Text('Page B'),
              ),
              Text(
                '$content',
                style: TextStyle(color: Colors.blue, fontSize: 20.0),
              ),
            ],
          )),
      title: 'routeStack',
    );
  }

  BPage({this.content});
}

class CPage extends StatelessWidget {
  String content;

  CPage({this.content});

  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
      child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context,true);
                },
                child: Text('Page c'),
              ),
              Text(
                '$content',
                style: TextStyle(color: Colors.blue, fontSize: 20.0),
              ),
            ],
          )),
      title: 'routeStack',
    );
  }
}
