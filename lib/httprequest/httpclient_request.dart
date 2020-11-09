import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_demo/customwidget/page_base_widget.dart';

class HttpClientRequestDemo extends StatefulWidget {
  @override
  _HttpClientRequestDemo createState() => _HttpClientRequestDemo();
}

class _HttpClientRequestDemo extends State<HttpClientRequestDemo> {
  String _data;

  getData() async {
    var httpClient = new HttpClient();
    var uri = Uri(
        scheme: 'https',
        host: 'github.com',
        path: '781238222/flutter-do/blob/master/README.md');

    HttpClientRequest request = await httpClient.getUrl(uri);
    request.headers.add('name', 'value');
    HttpClientResponse response = await request.close();
    String responseBody = await response.transform(utf8.decoder).join();
    print('responseBody:$responseBody');
    setState(() {
      _data = responseBody;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return PageBaseContainScaffoldWidget(
        title: 'httpClient',
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
              },
              child: Text('httpClient'),
            ),
            Text('$_data'),
          ],
        ));
  }


  }
}
