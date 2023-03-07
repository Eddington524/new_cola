// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      json['id'] as int,
      json['detailImgUrl'] as String,
      DateTime.parse(json['startDate'] as String),
      DateTime.parse(json['endDate'] as String),
      DateTime.parse(json['prizeDate'] as String),
      (json['commentList'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'detailImgUrl': instance.detailImgUrl,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'prizeDate': instance.prizeDate.toIso8601String(),
      'commentList': instance.commentList,
    };
