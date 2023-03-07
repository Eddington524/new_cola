import 'package:flutter/material.dart';
import 'package:new_cola/theme/custom_color.dart';

class Indicator extends StatelessWidget {
  final bool isActive;

  const Indicator({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      curve: Curves.easeInOut,
      width: 5,
      height: 5,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: isActive? CustomColors().lightOrange : CustomColors().darkGrey,
        shape: BoxShape.circle,
      ),
    );
  }
}
