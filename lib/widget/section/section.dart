import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final double? height;
  final Widget child;
  const Section({Key? key, required this.child, this.height}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: height,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom:20),
      margin: const EdgeInsets.only(bottom: 10),
      child: child,
      );
  }
}
