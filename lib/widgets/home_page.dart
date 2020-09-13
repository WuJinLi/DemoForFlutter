import 'package:flutter/material.dart';
import 'package:flutter_demo/constant/main_body_data.dart';
import 'package:flutter_demo/route_animaton/page_route_animation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ExpandStateBean> _data;

  @override
  void initState() {
    super.initState();
    _data = generateItems();
  }

  //children from ExpansionPanelList
  List<ExpansionPanel> _children() {
    return _data.map((e) {
      return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return ListTile(
            title: Text(
              e.headerValue,
              style: TextStyle(
                color: Colors.lightBlueAccent,
              ),
            ),
          );
        },
        body: _subWidget(e),
        isExpanded: e.isExpanded,
      );
    }).toList();
  }

  //subitem from children
  Widget _subWidget(ExpandStateBean e) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            e.expandedValues[index].text,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 15.0,
            ),
          ),
          onTap: () {
            if (e.expandedValues[index].targetWidget == null) {
              return null;
            }
            Navigator.of(context).push(
              PageRouteAnimation(
                widget: e.expandedValues[index].targetWidget,
                animationType: AnimationType.SLIDETRANSITIONTYPE,
              ),
            );
          },
        );
      },
      itemCount: e.expandedValues.length,
      //嵌套出现listview不能展示的问题，设置属性shrinkWrap，physics
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return index < e.expandedValues.length
            ? Divider(
                color: Colors.grey,
                height: 1.0,
              )
            : null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int panelIndex, bool isExpanded) {
          setState(() {
            _data[panelIndex].isExpanded = !isExpanded;
          });
        },
        children: _children(),
      ),
    );
  }
}
