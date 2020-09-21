import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';
import 'package:flutter_demo/customwidget/width_match_button_widget.dart';

class ShowDatePicker extends StatefulWidget {
  TypeOfShow type;

  ShowDatePicker({@required this.type});

  @override
  _ShowDatePickerState createState() => _ShowDatePickerState(type: type);
}

class _ShowDatePickerState extends State<ShowDatePicker> {
  TypeOfShow type;

  _ShowDatePickerState({@required this.type});

  var result_show;

  _showView(TypeOfShow type) {
    switch (type) {
      case TypeOfShow.showTimePicker:
        return WidthMatchBottonWidget(
            title: 'showTimePicker',
            onPressed: () async {
              var time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              // var time = await showTimePicker(
              //   context: context,
              //   initialTime: TimeOfDay(hour: 10, minute: 47),
              //   builder: (BuildContext context, Widget child) {
              //     return MediaQuery(
              //       data: MediaQuery.of(context)
              //           .copyWith(alwaysUse24HourFormat: true),
              //       child: child,
              //     );
              //   },
              // );
              setState(() {
                result_show = time.format(context);
              });
            });
      case TypeOfShow.showDatePicker:
        return WidthMatchBottonWidget(
          title: 'showDatePicker',
          onPressed: () async {
            var result = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime(2050),
              // builder: (context, child) {
              //   return Theme(data: ThemeData.dark(), child: child);
              // },//设置深色主题使 builder
            );

            setState(() {
              result_show = result;
            });
          },
        );
      case TypeOfShow.cupertinoDatePicker:
        return Container(
          height: 200,
          color: Colors.grey[200],
          child: CupertinoDatePicker(
            onDateTimeChanged: (date) {
              setState(() {
                result_show = date;
              });
            },
            initialDateTime: DateTime.now(),
          ),
        );

      /**
     * 设置显示模式：
        CupertinoTimerPickerMode.hm：显示 小时 | 分钟，英文效果16 hours | 14 min
        CupertinoTimerPickerMode.ms： 显示 分钟 | 秒，英文效果14 min | 43 sec
        CupertinoTimerPickerMode.hms：显示 小时 | 分钟 | 秒，英文效果16 hours | 14 min | 43 sec
     */
      case TypeOfShow.cupertinoTimerPicker:
        return CupertinoTimerPicker(
          onTimerDurationChanged: (time) {
            setState(() {
              result_show = time;
            });
          },
          backgroundColor: Colors.grey[200],
          mode: CupertinoTimerPickerMode.hms,
          initialTimerDuration: Duration(
              hours: DateTime.now().hour,
              minutes: DateTime.now().minute,
              seconds: DateTime.now().second),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('show datepicker'),
      ),
      body: PageBaseWidget(
        layout: Column(
          children: <Widget>[
            DescTextWidget(content: '$result_show'),
            _showView(type),
          ],
        ),
      ),
    );
  }
}

enum TypeOfShow {
  showDatePicker,
  showTimePicker,
  cupertinoDatePicker,
  cupertinoTimerPicker
}
