import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()

class News {
  final String itemThumnail;
  final String itemTitle;
  final String userImg;
  final String userName;
  final DateTime createdAt;
  final int likeCount;
  final int commentCount;
  final String content;

  News(this.itemThumnail, this.itemTitle, this.userImg, this.userName, this.createdAt, this.likeCount, this.commentCount, this.content);

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}