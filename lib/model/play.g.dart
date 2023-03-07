// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Play _$PlayFromJson(Map<String, dynamic> json) => Play(
      json['id'] as int?,
      json['mediaThumbnail'] as String?,
      json['mediaUrl'] as String?,
      json['userImg'] as String?,
    );

Map<String, dynamic> _$PlayToJson(Play instance) => <String, dynamic>{
      'id': instance.id,
      'mediaThumbnail': instance.mediaThumbnail,
      'userImg': instance.userImg,
      'mediaUrl': instance.mediaUrl,
    };
