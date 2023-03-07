import 'package:flutter/material.dart';

class ItemTitle extends StatelessWidget {
  final String firstText;
  final bool isFirstBold;
  final String? secondText;

  const ItemTitle({
    Key? key,
    required this.firstText,
    required this.isFirstBold,
    this.secondText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var testStyle = TextStyle(
        fontSize: 25,
        fontWeight: isFirstBold ? FontWeight.w600 : FontWeight.normal);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Text(firstText, style: testStyle),
          Text(secondText ?? "",
              style: testStyle.copyWith(
                  fontWeight:
                  isFirstBold ? FontWeight.normal : FontWeight.w600)),
        ],
      ),
    );
  }
}