import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  String _editStr = '';
  String _editChangingStr = '';
  String _onEditingComplete = '';
  TextEditingController _controller; //TextField监听器

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化监听器
    _controller = new TextEditingController()
      ..addListener(() {
        setState(() {
          _editChangingStr = _controller.text;
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              //设置输入最大长度
              maxLength: 20,
              //设置显示行数
              maxLines: 1,
              // 输入框右下角经常需要字数统计，除了使用上面介绍的方法外，还可以使用buildCounter，建议使用此方法
              buildCounter: (
                BuildContext context, {
                int currentLength,
                int maxLength,
                bool isFocused,
              }) {
                return Text(
                  '$currentLength/$maxLength',
                );
              },
              decoration: InputDecoration(
                //输入框控件外部的图标设置
                // icon: Icon(Icons.edit),
                //文本提示。左上角
                // labelText: 'username',
                //文本提示文本样式设置
                labelStyle: TextStyle(color: Colors.green),
                //参数控制当输入框获取焦点或者不为空时是否还显示,默认为true，显示
                hasFloatingPlaceholder: true,
                //显示在输入框的左下部，用于提示用户
                helperText: '用户名长度为6-10个字母',
                helperStyle: TextStyle(color: Colors.red),
                helperMaxLines: 1,
                //当输入框为空时的提示，不为空时不在显示
                hintText: '请输入用户名',
                hintStyle: TextStyle(color: Colors.cyanAccent),
                hintMaxLines: 1,
                //显示在输入框的左下部，默认字体为红色
                // errorText: '用户名输入错误',
                // errorStyle: TextStyle(fontSize: 12.0),
                // errorMaxLines: 1,
                // errorBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.red),
                // ),
                //输入框前面的部分
                prefixIcon: Icon(Icons.people),
                //输入框尾部的部分
                // suffixIcon: Icon(Icons.email),
                counterText: '${_editStr.length}/32',
                filled: true,
                fillColor: Color(0x30cccccc),
                //默认的状态外边框样式
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00FF0000),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                //获取焦点编辑样式
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
              ),
              //设置监听器
              controller: _controller,
              //keyboardType参数控制软键盘的类型
              // keyboardType: TextInputType.number,
              //textAlignVertical表示垂直方向的对齐方式
              textAlignVertical: TextAlignVertical.center,
              //textDirection表示文本方向
              textDirection: TextDirection.ltr,
              //toolbarOptions表示长按时弹出的菜单，有copy、cut、paste、selectAll 业务中可根据业务需求对其进行指定的设置
              toolbarOptions: ToolbarOptions(
                copy: true,
                cut: true,
                selectAll: true,
                paste: false,
              ),
              //cursor表示光标
              showCursor: true,
              cursorRadius: Radius.circular(10.0),
              cursorWidth: 3.0,
              cursorColor: Colors.greenAccent,
              //obscureText 设置密码框
              // obscureText: true,
              //inputFormatters可以限制用户输入的内容，比如只想让用户输入字符
              // inputFormatters: [
              //   WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),
              // ],
              //onChanged是当内容发生变化时回调，onSubmitted是点击回车或者点击软键盘上的完成回调
              onChanged: (value) {
                setState(() {
                  _editStr = value;
                });
              },

              onEditingComplete: () {
                setState(() {
                  _onEditingComplete = _controller.text;
                });
              },
              onTap: () {
                print('onTap');
              },
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: Text(
                'controller:$_editChangingStr',
                style: TextStyle(fontSize: 20.0, color: Colors.lightBlue),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: Text(
                'onChanged:$_editStr',
                style: TextStyle(fontSize: 20.0, color: Colors.lightBlue),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: Text(
                'onEditingComplete:$_onEditingComplete',
                style: TextStyle(fontSize: 20.0, color: Colors.lightBlue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
