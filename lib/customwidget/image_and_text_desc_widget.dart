import 'package:flutter/material.dart';

class ImageHasDescWidget extends StatelessWidget {
  BoxFit boxFit;

  ImageHasDescWidget({this.boxFit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.0,
      height: 130.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey[100], width: 1.0, style: BorderStyle.solid),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/img_flutter.png',
            width: 30,
            height: 50,
            fit: boxFit,
            frameBuilder: (BuildContext context, Widget child, int frame,
                bool wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) {
                return child;
              }
              return AnimatedOpacity(
                child: child,
                opacity: frame == null ? 0 : 1,
                duration: const Duration(seconds: 2),
                curve: Curves.easeOut,
              );
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            '$boxFit',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class ImageHasLoadingProgressWidget extends StatelessWidget {
  String path;

  ImageHasLoadingProgressWidget({@required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.0,
      height: 130.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey[100], width: 1.0, style: BorderStyle.solid),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
            path,
            width: 30,
            height: 50,
            fit: BoxFit.contain,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes
                      : null,
                ),
              );
            },
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
