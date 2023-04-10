// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notifications _$NotificationsFromJson(Map<String, dynamic> json) =>
    Notifications(
      json['imageUrl'] as String,
      json['title'] as String,
      json['createdAt'] as String,
      json['sideImageUrl'] as String,
    );

Map<String, dynamic> _$NotificationsToJson(Notifications instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'createdAt': instance.createdAt,
      'sideImageUrl': instance.sideImageUrl,
    };
