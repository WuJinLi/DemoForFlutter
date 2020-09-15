import 'package:flutter/material.dart';
import 'package:flutter_demo/customwidget/page_base_widget.dart';
import 'package:flutter_demo/customwidget/decs_text_widget.dart';
import 'package:flutter_demo/customwidget/image_and_text_desc_widget.dart';
import 'package:toast/toast.dart';

class ImageAndIconWidget extends StatefulWidget {
  @override
  _ImageAndIconWidgetState createState() => _ImageAndIconWidgetState();
}

class _ImageAndIconWidgetState extends State<ImageAndIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image and Icon'),
        centerTitle: true,
      ),
      body: PageBaseWidget(
        layout: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          reverse: false,
          child: Column(
            children: <Widget>[
              DescTextWidget(
                  content: 'Image:\n用于显示图片，图片的来源可以是网络、项目中图片或者设备上的图片'),
              DescTextWidget(content: '加载网络图片：Image.network'),
              ImageHasLoadingProgressWidget(
                  path:
                      'https://cdn.jsdelivr.net/gh/flutterchina/website@1.0/images/flutter-mark-square-100.png'),
              DescTextWidget(
                  content:
                      '加载项目中图片：Image.asset\n首先将图片拷贝到项目中，通常情况下，拷贝到assets/images/目录下，assets/images/目录为手动创建，新建的项目默认是没有此目录的,设置pubspec.yaml配置文件'),
              Image.asset(
                'images/img_flutter.png',
                width: 100.0,
                height: 50.0,
              ),
              DescTextWidget(
                  content:
                      '加载设备上的图片：Image.file\n要加载设备（手机）上的图片首先需要获取设备图片的路径，由于不同平台的路径不同，因此路径的获取必须依靠原生支持，如果了解原生（Android和iOS）开发，可以直接使用MethodChannel获取路径，如果不懂原生（Android和iOS）开发，可以使用第三方插件获取路径，这里推荐官方的path_provider'),
              DescTextWidget(
                  content:
                      'width/height:用来设置图片本身的宽高\nfit:参数就是设置填充方式\nfill：完全填充，宽高比可能会变。\ncontain：等比拉伸，直到一边填充满。\ncover：等比拉伸，直到2边都填充满，此时一边可能超出范围。\nfitWidth：等比拉伸，宽填充满。\nfitHeight：等比拉伸，高填充满。\nnone：当组件比图片小时，不拉伸，超出范围截取。\nscaleDown：当组件比图片小时，图片等比缩小，效果和contain一样'),
              Wrap(
                children: <Widget>[
                  ImageHasDescWidget(boxFit: BoxFit.fill),
                  ImageHasDescWidget(boxFit: BoxFit.contain),
                  ImageHasDescWidget(boxFit: BoxFit.cover),
                  ImageHasDescWidget(boxFit: BoxFit.fitWidth),
                  ImageHasDescWidget(boxFit: BoxFit.fitHeight),
                  ImageHasDescWidget(boxFit: BoxFit.none),
                  ImageHasDescWidget(boxFit: BoxFit.scaleDown),
                ],
              ),
              DescTextWidget(
                  content:
                      'filterQuality:\n表示绘制图像的质量，从高到低为：high->medium->low->none。越高效果越好，越平滑，当然性能损耗越大，默认是low，如果发现图片有锯齿，可以设置此参数。'),
              DescTextWidget(
                  content:
                      '当加载图片的时候回调frameBuilder，当此参数为null时，此控件将会在图片加载完成后显示，未加载完成时显示空白，尤其在加载网络图片时会更明显。因此此参数可以用于处理图片加载时显示占位图片和加载图片的过渡效果，比如淡入淡出效果。'),
              ImageHasDescWidget(boxFit: BoxFit.contain),
              DescTextWidget(
                  content:
                      'loadingBuilder:\n参数比frameBuilder控制的力度更细，可以获取图片加载的进度，下面的案例显示了加载进度条'),
              ImageHasLoadingProgressWidget(
                path:
                    'https://cdn.jsdelivr.net/gh/flutterchina/website@1.0/images/flutter-mark-square-100.png',
              ),
              DescTextWidget(
                  content:
                      'centerSlice:\n用于.9图，.9图用于拉伸图片的特定区域，centerSlice设置的区域（Rect）就是拉伸的区域。.9图通常用于控件大小、宽高比不固定的场景，比如聊天背景图片等'),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      centerSlice: Rect.fromLTWH(20, 20, 10, 10),
                      image: AssetImage(
                        'images/img_flutter.png',
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              DescTextWidget(
                  content: 'Icon是图标组件，Icon不具有交互属性，如果想要交互，可以使用IconButton'),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  border: Border.all(
                      color: Colors.grey[100],
                      style: BorderStyle.solid,
                      width: 1.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: Colors.greenAccent,
                      size: 40.0,
                      semanticLabel: 'add',
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.cancel,
                          size: 40.0,
                          color: Colors.orange,
                        ),
                        onPressed: () {
                          Toast.show('cancle', context);
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
