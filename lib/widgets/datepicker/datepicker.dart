import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';
import 'package:flutter_demo/customwidget/width_match_button_widget.dart';

class ShowDatePicker extends StatefulWidget {
  @override
  _ShowDatePickerState createState() => _ShowDatePickerState();
}

class _ShowDatePickerState extends State<ShowDatePicker> {
  var result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('show datepicker'),
      ),
      body: PageBaseWidget(
          layout: Column(
        children: <Widget>[
          DescTextWidget(content: '$result'),
          WidthMatchBottonWidget(
            title: '弹出日期选择组件',
            onPressed: () async {
              setState(() async{
                result = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2050),
                    builder: (context, child) {
                      return Theme(data: ThemeData.dark(), child: child);
                    });
              });
            },
          )
        ],
      )),
    );
  }
}
