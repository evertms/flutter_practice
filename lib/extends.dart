import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  void go(String routename) => Navigator.pushNamed(this, routename);
}
