import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  final int commentId;
  final int userId;
  final String userName;
  final String userImgUrl;
  final String content;
  final DateTime createdAt;
  final int likeCount;

  Comment(this.commentId, this.userId, this.userName, this.userImgUrl, this.content, this.createdAt, this.likeCount);

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
