import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  final String text;

  const MoreButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 30,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white54,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          '$text',
          style: TextStyle(fontSize: 13, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
