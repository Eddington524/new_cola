import 'package:flutter/material.dart';

class Small_button extends StatefulWidget {
  final double w;
  final double h;
  final Color bgColor;
  final Color textColor;
  final String text;
  late double? borderRadius;

 Small_button(
      {Key? key,
      required this.w,
      required this.h,
      required this.bgColor,
      required this.text,
      required this.textColor,
      this.borderRadius})
      : super(key: key);

  @override
  State<Small_button> createState() => _Small_buttonState();
}

class _Small_buttonState extends State<Small_button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.w,
      height: widget.h,
      child: ElevatedButton(
        onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
            ),
          ),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(color: widget.textColor),
        ),
      ),
    );
  }
}
