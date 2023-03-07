// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      json['itemThumnail'] as String,
      json['itemTitle'] as String,
      json['userImg'] as String,
      json['userName'] as String,
      json['likeCount'] as int,
      json['commentCount'] as int,
      json['tag'] as String,
      json['content'] as String,
      DateTime.parse(json['uploadDate'] as String),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'itemThumnail': instance.itemThumnail,
      'itemTitle': instance.itemTitle,
      'userImg': instance.userImg,
      'userName': instance.userName,
      'likeCount': instance.likeCount,
      'commentCount': instance.commentCount,
      'tag': instance.tag,
      'content': instance.content,
      'uploadDate': instance.uploadDate.toIso8601String(),
    };
