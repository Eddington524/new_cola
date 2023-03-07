// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      json['itemThumnail'] as String,
      json['itemTitle'] as String,
      json['userImg'] as String,
      json['userName'] as String,
      DateTime.parse(json['createdAt'] as String),
      json['likeCount'] as int,
      json['commentCount'] as int,
      json['content'] as String,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'itemThumnail': instance.itemThumnail,
      'itemTitle': instance.itemTitle,
      'userImg': instance.userImg,
      'userName': instance.userName,
      'createdAt': instance.createdAt.toIso8601String(),
      'likeCount': instance.likeCount,
      'commentCount': instance.commentCount,
      'content': instance.content,
    };
