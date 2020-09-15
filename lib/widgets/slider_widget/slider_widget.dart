import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _sliderValue = 0;
  RangeValues _rangeValues = RangeValues(0, 25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
        centerTitle: true,
      ),
      body: PageBaseWidget(
        layout: SingleChildScrollView(
          //滑动的方向 Axis.vertical为垂直方向滑动，Axis.horizontal 为水平方向
          scrollDirection: Axis.vertical,
          //滑动到底部回弹效果
          physics: BouncingScrollPhysics(),
          //true 滑动到底部
          reverse: false,
          child: Column(
            children: <Widget>[
              DescTextWidget(content: 'Slider:'),
              Text('slider当前值：$_sliderValue'),
              Slider(
                //当前slide取值
                value: _sliderValue,
                //滑动slider时的回调
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
                //slider滑动区间，默认 0-1
                min: 0,
                max: 100,
                //滑块的颜色
                activeColor: Colors.cyanAccent,
                //滑条的颜色
                inactiveColor: Colors.grey,
                label: '$_sliderValue',
                //设置滑块的滑动为 离散的，即滑动值为 0、20 、40、60 、80、100：
                divisions: 5,
              ),
              DescTextWidget(content: '自定义样式:SliderTheme实现'),
              DescTextWidget(
                  content:
                      'SliderTheme属性介绍：\nactiveTrackColor:已拖动的颜色\ninactiveTrackColor:未拖动的颜色\ninactiveTickMarkColor:divisions对进度线分割后，断续线中间间隔的颜色\nactiveTickMarkColor:divisions对进度线分割后,已拖动断续线中间间隔的颜色\nthumbColor:滑块中心的颜色\noverlayColor:滑块边缘的颜色\nvalueIndicatorColor:提示进度的气泡的背景色\nvalueIndicatorTextStyle:提示进度的气泡文本的颜色'),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  //已拖动的颜色
                  activeTrackColor: Colors.white,
                  //未拖动的颜色
                  inactiveTrackColor: Colors.deepPurpleAccent,
                  //divisions对进度线分割后，断续线中间间隔的颜色
                  inactiveTickMarkColor: Colors.orange,
                  //divisions对进度线分割后,已拖动断续线中间间隔的颜色
                  activeTickMarkColor: Color(0xff404080),
                  //滑块中心的颜色
                  thumbColor: Colors.blue,
                  //滑块边缘的颜色
                  overlayColor: Colors.green,
                  //提示进度的气泡的背景色
                  valueIndicatorColor: Colors.purpleAccent,
                  //提示进度的气泡文本的颜色
                  valueIndicatorTextStyle: TextStyle(color: Colors.white),
                ),
                child: Slider(
                  value: _sliderValue,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                  min: 0,
                  max: 100,
                  divisions: 5,
                  label: '$_sliderValue',
                ),
              ),
              DescTextWidget(content: 'RangeSlider:'),
              RangeSlider(
                values: _rangeValues,
                onChanged: (RangeValues newValues) {
                  setState(() {
                    _rangeValues = newValues;
                  });
                },
                min: 0,
                max: 100,
                divisions: 4,
                labels:
                    RangeLabels('${_rangeValues.start}', '${_rangeValues.end}'),
              ),
              DescTextWidget(
                  content:
                      'labels:RangeLabels对象，RangeLabels(this.start, this.end)\nvalues:RangeValues(this.start, this.end)'),
            ],
          ),
        ),
      ),
    );
  }
}
