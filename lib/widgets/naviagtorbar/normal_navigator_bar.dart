import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/each_view_widget.dart';

class NormalNavigatorBar extends StatefulWidget {
  @override
  _NormalNavigatorBarState createState() => _NormalNavigatorBarState();
}

class _NormalNavigatorBarState extends State<NormalNavigatorBar> {
  int _currentIndex = 0;
  List<Widget> items = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items
      ..add(
        EachViewWidge(
          content: 'home',
        ),
      )
      ..add(
        EachViewWidge(
          content: 'message',
        ),
      )
      ..add(
        EachViewWidge(
          content: 'note',
        ),
      )
      ..add(
        EachViewWidge(
          content: 'settings',
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('规则的底部导航'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text('message'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            title: Text('note'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('settings'),
          ),
        ],
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.blueGrey,
        unselectedFontSize: 14.0,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        elevation: 4,
      ),
      body: items[_currentIndex],
    );
  }
}
