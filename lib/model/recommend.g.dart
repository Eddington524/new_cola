// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recommend _$RecommendFromJson(Map<String, dynamic> json) => Recommend(
      json['tagImgUrl'] as String,
      json['tagName'] as String,
      json['userName'] as String,
      json['likeCount'] as int,
      json['collectionCount'] as int,
    );

Map<String, dynamic> _$RecommendToJson(Recommend instance) => <String, dynamic>{
      'tagImgUrl': instance.tagImgUrl,
      'tagName': instance.tagName,
      'userName': instance.userName,
      'likeCount': instance.likeCount,
      'collectionCount': instance.collectionCount,
    };
