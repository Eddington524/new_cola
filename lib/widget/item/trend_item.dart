import 'package:flutter/material.dart';

class TrendItem extends StatelessWidget{
  final String itemImgUrl;
  final String itemName;
  final String userImgUrl;
  final String userName;
  final int likeCount;
  final int commentCount;

  const TrendItem({
    super.key,
    required this.itemImgUrl,
    required this.itemName,
    required this.userImgUrl,
    required this.userName,
    required this.likeCount,
    required this.commentCount,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start ,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
                itemImgUrl,
                fit: BoxFit.fill),
          ),
          Text(itemName),
          /// profile img + name
          Row(
            children: [
              Container(
                width: 20,
                margin: EdgeInsets.only(right: 5),
                child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(50.0),
                  child: Image.network(
                      userImgUrl,
                      fit: BoxFit.fill),
                ),
              ),
              Text(userName)
            ],
          ),
          /// like, comment
          Row(
            children: [
              const Icon(Icons.favorite_border),
              Text('$likeCount'),
              const Icon(Icons.comment_outlined),
              Text('$commentCount'),
            ],
          )
        ],
      ),
    );
  }
}