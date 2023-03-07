import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  final String imgUrl;
  final double? width;
  final double? height;
  final bool isCicle;

  const ItemImage({Key? key, required this.imgUrl, this.width, this.height, required this.isCicle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: isCicle ? BorderRadius.circular(50.0) : BorderRadius.circular(15.0),
        child: Image.network(
          imgUrl,
            fit: BoxFit.cover),
      ),
    );
  }
}
