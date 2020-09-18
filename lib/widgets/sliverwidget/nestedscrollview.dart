import 'package:flutter/material.dart';

class NestedScrollViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 150,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'NestedScrollViewWidget',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  background: Image.asset(
                    'images/img_sliver_appbar.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ];
          },
          body: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                color: Colors.primaries[index % Colors.primaries.length],
                alignment: Alignment.center,
                height: 80,
                child: Text(
                  '$index',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
            },
            itemCount: 10,
          )),
    );
  }
}
