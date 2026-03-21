import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  void go(String routeName) => Navigator.pushNamed(this, routeName);
}
