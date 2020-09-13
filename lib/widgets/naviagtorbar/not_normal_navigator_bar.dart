import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/each_view_widget.dart';

class NotNormalNavigatorBar extends StatefulWidget {
  @override
  _NotNormalNavigatorBarState createState() => _NotNormalNavigatorBarState();
}

class _NotNormalNavigatorBarState extends State<NotNormalNavigatorBar> {
  int _currentIndex = 0;
  List<EachViewWidge> items = new List();
  List<bool> itemsStatus;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items
      ..add(EachViewWidge(
        content: 'home',
      ))
      ..add(EachViewWidge(
        content: 'message',
      ))
      ..add(EachViewWidge(
        content: 'note',
      ))
      ..add(EachViewWidge(
        content: 'settings',
      ))
      ..add(EachViewWidge(
        content: 'add',
      ));

    itemsStatus = new List<bool>.generate(4, (index) {
      if (index == _currentIndex) {
        return true;
      } else {
        return false;
      }
    });
  }

  _resetItemsStatus(int index) {
    for (int i = 0; i < itemsStatus.length; i++) {
      if (i == index) {
        itemsStatus[i] = true;
      } else {
        itemsStatus[i] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('不规则的底部导航'),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60.0,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  size: 30.0,
                  color: itemsStatus[0] ? Colors.lightBlue : Colors.blueGrey,
                ),
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                    _resetItemsStatus(0);
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.message,
                  size: 30.0,
                  color: itemsStatus[1] ? Colors.lightBlue : Colors.blueGrey,
                ),
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                    _resetItemsStatus(1);
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.note,
                  size: 30.0,
                  color: itemsStatus[2] ? Colors.lightBlue : Colors.blueGrey,
                ),
                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
                    _resetItemsStatus(2);
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.settings,
                  size: 30.0,
                  color: itemsStatus[3] ? Colors.lightBlue : Colors.blueGrey,
                ),
                onPressed: () {
                  setState(() {
                    _currentIndex = 3;
                    _resetItemsStatus(3);
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _currentIndex = 4;
          });
        },
        child: Icon(Icons.add),
      ),
      body: items[_currentIndex],
    );
  }
}
