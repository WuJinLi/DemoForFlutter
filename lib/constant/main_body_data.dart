import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/text/text_widget.dart';
import 'package:flutter_demo/widgets/text/richtext_widget.dart';
import 'package:flutter_demo/widgets/text/textfield_widget.dart';
import 'package:flutter_demo/widgets/naviagtorbar/normal_navigator_bar.dart';
import 'package:flutter_demo/widgets/naviagtorbar/not_normal_navigator_bar.dart';
import 'package:flutter_demo/widgets/buttom/buttom_widget.dart';
import 'package:flutter_demo/widgets/radio/radio_widget.dart';
import 'package:flutter_demo/widgets/checkbox/checkbox_widget.dart';
import 'package:flutter_demo/widgets/slider/slider_widget.dart';
import 'package:flutter_demo/widgets/switch/switch_widget.dart';
import 'package:flutter_demo/widgets/progressIndicator/progressIndicator_widget.dart';
import 'package:flutter_demo/widgets/imageandicon/image_and_icon_widget.dart';
import 'package:flutter_demo/layout/row_and_column_layout.dart';
import 'package:flutter_demo/layout/stack_layout.dart';
import 'package:flutter_demo/layout/wrap_layout.dart';
import 'package:flutter_demo/demos/mine_copy_for_juejin.dart';
import 'package:flutter_demo/demos/buttom_for_loading.dart';
import 'package:flutter_demo/demos/drawing_board.dart';
import 'package:flutter_demo/widgets/listview/listview_widget.dart';
import 'package:flutter_demo/widgets/gridview/grdiview_widget.dart';

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
              targetWidget: RichTextWidgetPage(),
              text: '富文本-RichText',
            ),
          )
          ..add(
            ChildItemBean(
              targetWidget: TextFieldPage(),
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
              targetWidget: ButtomWidget(),
              text: '按钮组件',
            ),
          )
          ..add(
            ChildItemBean(
              targetWidget: RadioWidget(),
              text: '单选组件',
            ),
          )
          ..add(
            ChildItemBean(
              targetWidget: CheckBoxWidget(),
              text: '复选组件',
            ),
          )
          ..add(
            ChildItemBean(
              targetWidget: SliderWidget(),
              text: '滑块组件',
            ),
          )
          ..add(
            ChildItemBean(
              targetWidget: SwitchWidget(),
              text: '开关组件',
            ),
          )
          ..add(
            ChildItemBean(
              targetWidget: ProgressIndicatorWidget(),
              text: '进度组件',
            ),
          )
          ..add(
            ChildItemBean(
              targetWidget: ImageAndIconWidget(),
              text: '图片和图标组件',
            ),
          ),
        headerValue: '基础组件',
      ),
    )
    ..add(
      ExpandStateBean(
        isExpanded: false,
        expandedValues: new List()
          ..add(
            ChildItemBean(
              targetWidget: RowAndColumnLayoutWidget(),
              text: '水平/垂直布局-row/column',
            ),
          )
          ..add(
            ChildItemBean(
              targetWidget: StackLayout(),
              text: '叠加布局-stack/IndexedStack',
            ),
          )
          ..add(
            ChildItemBean(
              targetWidget: WarpLayout(),
              text: '流式布局组件-Wrap',
            ),
          ),
        headerValue: '布局组件',
      ),
    )
    ..add(ExpandStateBean(
        isExpanded: false,
        expandedValues: new List()
          ..add(
            ChildItemBean(targetWidget: ListViewWidget(), text: 'ListView'),
          )
          ..add(
            ChildItemBean(targetWidget: GridViewWidget(), text: 'GridView'),
          ),
        headerValue: '滚动和大数据组件'))
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
          )
          ..add(
            ChildItemBean(
                targetWidget: MinePageCopyForJueJin(), text: '仿掘金我的页面'),
          )
          ..add(
            ChildItemBean(targetWidget: ButtomForLodaing(), text: '登录进度按钮'),
          )
          ..add(
            ChildItemBean(targetWidget: DrawingBoard(), text: '画板'),
          ),
        headerValue: '实战小案例',
      ),
    );
}
