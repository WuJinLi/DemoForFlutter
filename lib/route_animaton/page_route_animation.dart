import 'package:flutter/material.dart';

class PageRouteAnimation extends PageRouteBuilder {
  Widget widget;
  AnimationType animationType;
  PageRouteAnimation({@required this.widget, this.animationType})
      : super(
            transitionDuration: Duration(seconds: 1),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              Widget resultWidget;
              switch (animationType) {
                case AnimationType.FADETRANSITIONTYPE:
                  resultWidget = FadeTransition(
                    opacity: Tween(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                          parent: animation, curve: Curves.fastOutSlowIn),
                    ),
                    child: child,
                  );

                  break;
                case AnimationType.SLIDETRANSITIONTYPE:
                  resultWidget = SlideTransition(
                    position: Tween<Offset>(
                            begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                        .animate(
                      CurvedAnimation(
                          parent: animation, curve: Curves.fastOutSlowIn),
                    ),
                    child: child,
                  );
                  break;
                case AnimationType.SCALETRANSITIONTYPE:
                  resultWidget = ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                          parent: animation, curve: Curves.fastOutSlowIn),
                    ),
                    child: child,
                  );
                  break;
                default:
                  resultWidget = FadeTransition(
                    opacity: Tween(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                          parent: animation, curve: Curves.fastOutSlowIn),
                    ),
                    child: child,
                  );
                  break;
              }

              return resultWidget;
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            });
}

enum AnimationType {
  FADETRANSITIONTYPE,
  SCALETRANSITIONTYPE,
  SLIDETRANSITIONTYPE
}
