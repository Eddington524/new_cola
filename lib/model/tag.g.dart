// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      json['tagImgUrl'] as String,
      json['tagName'] as String,
      json['userName'] as String,
      json['likeCount'] as int,
      json['collectionCount'] as int,
    );

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'tagImgUrl': instance.tagImgUrl,
      'tagName': instance.tagName,
      'userName': instance.userName,
      'likeCount': instance.likeCount,
      'collectionCount': instance.collectionCount,
    };
