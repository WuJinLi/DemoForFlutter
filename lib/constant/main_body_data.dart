import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/text_widget.dart';
import 'package:flutter_demo/widgets/naviagtorbar/normal_navigator_bar.dart';
import 'package:flutter_demo/widgets/naviagtorbar/not_normal_navigator_bar.dart';

// 控制打开和关闭的类
class ExpandStateBean {
  List<ChildItemBean> expandedValues;
  String headerValue;
  bool isExpanded;

  ExpandStateBean({this.isExpanded, this.expandedValues, this.headerValue});
}

class ChildItemBean {
  String text;
  Widget targetWidget;

  ChildItemBean({this.targetWidget, this.text});
}

List<ExpandStateBean> generateItems() {
  return new List()
    ..add(
      ExpandStateBean(
        isExpanded: false,
        expandedValues: new List()
          ..add(
            ChildItemBean(
              targetWidget: TextWidgetPage(),
              text: '文本组建-text',
            ),
          )
          ..add(
            ChildItemBean(
              targetWidget: null,
              text: '富文本-RichText',
            ),
          )
          ..add(
            ChildItemBean(
              targetWidget: null,
              text: '文本输入-textField',
            ),
          ),
        headerValue: '文本组件',
      ),
    )
    ..add(
      ExpandStateBean(
        isExpanded: false,
        expandedValues: new List()
          ..add(
            ChildItemBean(
              targetWidget: NormalNavigatorBar(),
              text: '规则底部导航',
            ),
          )
          ..add(
            ChildItemBean(
              targetWidget: NotNormalNavigatorBar(),
              text: '不规则底部导航',
            ),
          ),
        headerValue: '实战小案例',
      ),
    );
}
