import 'package:flutter/material.dart';
import 'package:flutter_demo/constant /main_body_data.dart';
import 'package:flutter_demo/route_animaton/page_route_animation.dart';

// ignore: must_be_immutable
class MainPageGridViewItem extends StatelessWidget {
  MainPageBodyData data;

  MainPageGridViewItem({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.blue.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(3.0),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              this.data.image,
              fit: BoxFit.contain,
              width: 25.0,
              color: this.data.color,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              this.data.title,
              style: TextStyle(
                color: this.data.color,
                fontSize: 10.0,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(PageRouteAnimation(widget: data.widget));
      },
    );
  }
}
