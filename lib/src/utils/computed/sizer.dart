import 'package:flutter/material.dart';

abstract class SizeUtils {
  static double width(BuildContext context, double percent) =>
      MediaQuery.of(context).size.width * (percent / 100);
  static double height(BuildContext context, double percent) =>
      MediaQuery.of(context).size.height * (percent / 100);
}
