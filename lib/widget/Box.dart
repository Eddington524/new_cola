import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final double w;
  final double h;
  final Color bgColor;
  final Color textColor;
  final String text;
  late double? borderRadius;

  Box(
      {Key? key,
      required this.text,
      required this.w,
      required this.h,
      required this.bgColor,
      required this.textColor,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
      ),
      child: Center(
        child: Text(
          text,
          // textAlign: TextAlign.center,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
