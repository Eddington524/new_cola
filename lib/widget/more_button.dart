import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  final String text;
  final String type;
  Function onTap;

   MoreButton({super.key, required this.text, required this.type, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 30,
      child: ElevatedButton(
        onPressed: () {
          onTap.call();
          // if(type == 'trend'){
          //   Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => TrendGridView(isTabView: false)));
          // }
          // if(type == 'tags'){
          //
          // }
          // if(type == 'market'){
          //
          // }

        },
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
