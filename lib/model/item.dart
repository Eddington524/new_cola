import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  final String itemThumnail;
  final String itemTitle;
  final String userImg;
  final String userName;
  final int likeCount;
  final int commentCount;
  final String tag;
  final String content;
  final DateTime uploadDate;

  Item(this.itemThumnail, this.itemTitle, this.userImg, this.userName, this.likeCount, this.commentCount, this.tag, this.content, this.uploadDate);

  factory Item.fromJson(Map<String, dynamic> json) {
    return _$ItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}