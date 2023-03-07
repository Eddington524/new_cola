import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:new_cola/model/item.dart';
import 'package:new_cola/theme/custom_color.dart';
import 'package:new_cola/widget/item_image.dart';
import 'package:new_cola/widget/link_listview.dart';
import 'package:new_cola/widget/small_button.dart';

class ItemDetailPage extends StatefulWidget {
  const ItemDetailPage({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  bool isMyLiked = false;
  bool isFollowed = false;

  void onClick() {
    isFollowed = !isFollowed;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border)),
            IconButton(onPressed: () {}, icon: Icon(Icons.share)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ItemImage(
                            width: 50,
                            imgUrl: widget.item.userImg,
                            isCicle: true),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.item.userName,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              widget.item.uploadDate.toString(),
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: onClick,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isFollowed
                              ? CustomColors().lightOrange
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(isFollowed ? '팔로우' : '팔로잉',
                            style: TextStyle(
                                color:
                                    isFollowed ? Colors.white : Colors.black)),
                      ),
                    )
                  ],
                ),
              ),
              Image.network(
                widget.item.itemThumnail,
                fit: BoxFit.contain,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  LikeButton(
                      size: 20,
                      isLiked: isMyLiked,
                      likeCount: isMyLiked
                          ? widget.item.likeCount + 1
                          : widget.item.likeCount),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.comment_outlined)),
                  Text('${widget.item.commentCount}'),
                ],
              ),
              Text(
                '${widget.item.itemTitle}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  '${widget.item.content}',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Small_button(
                        w: 85,
                        h: 30,
                        bgColor: CustomColors().mainBlue,
                        text: '${widget.item.tag}',
                        textColor: Colors.white),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    '연관된 아이템',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
        Container(
            height: 200,
            padding: EdgeInsets.symmetric(horizontal: 20), child: LinkListView())
            ],
          ),
        ));
  }
}
