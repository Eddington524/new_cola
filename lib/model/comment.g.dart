// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      json['commentId'] as int,
      json['userId'] as int,
      json['userName'] as String,
      json['userImgUrl'] as String,
      json['content'] as String,
      DateTime.parse(json['createdAt'] as String),
      json['likeCount'] as int,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'commentId': instance.commentId,
      'userId': instance.userId,
      'userName': instance.userName,
      'userImgUrl': instance.userImgUrl,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'likeCount': instance.likeCount,
    };
