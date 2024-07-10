import 'package:flutter/material.dart';

extension PageRouteExtension on Widget {
  PageRoute get materialPageRoute => MaterialPageRoute(builder: (_) => this);
}
