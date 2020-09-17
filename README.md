# flutter_demo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### Flexible和 Expanded的区别是
### Scaffold.of() called with a context that does not contain a Scaffold. -> [body下再加一层Builder](https://api.flutter.dev/flutter/material/Scaffold/of.html)
### 使用column/row超出父布局，使其滑动避免布局溢出。-> 外部套用SingleChildScrollView组件进行包裹， scrollDirection：滑动的方向 Axis.vertical为垂直方向滑动，Axis.horizontal 为水平方向， physics: //滑动到底部回弹效果,reverse: fal滑动到底部e,
### 解决SingleChildScrollView里面嵌套Column和ListView时候,ListView不显示 ->设置listview属性shrinkWrap: true，shrinkWrap多用于嵌套listView中 内容大小不确定 比如 垂直布局中 先后放入文字 listView （需要Expend包裹否则无法显示无穷大高度 但是需要确定listview高度 shrinkWrap使用内容适配不会有这样的影响）