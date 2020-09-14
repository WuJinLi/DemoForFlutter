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


##flutter踩坑记录:

1.展示snackBar时出"Scaffold.of() called with a context that does not contain a Scaffold"异常
  原因：因为你传递的 BuildContext 不是 Scaffold 的，而是当前parent widget的
  解决方案：
  + 使用 Builder 包裹

  、、、
    body: Builder(
      builder: (BuildContext context){
        return Column(
          children: <Widget>[

          ],
        );
      },
    ),
  、、、

  +给Scaffold 设置一个全局 key，通过 key 的如下方法来显示

  、、、
    var _scaffoldkey = new GlobalKey<ScaffoldState>();Scaffold(
        key: _scaffoldkey,
        body: SafeArea(
            child: _buildContent(),
            ),)// 显示 SnackBar 的方法void showSnackBar(String text) {
        _scaffoldkey.currentState.showSnackBar(SnackBar(
            content: Text(text),
            backgroundColor: Colors.blueAccent,
        ));}
  、、、
