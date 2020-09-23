import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final routes = {};

var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      return MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments))
      as Route;
    } else {
      return MaterialPageRoute(
          builder: (context) => pageContentBuilder(context)) as Route;
    }
  }
};
