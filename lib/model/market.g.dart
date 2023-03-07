// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Market _$MarketFromJson(Map<String, dynamic> json) => Market(
      json['itemThumnail'] as String,
      json['itemTitle'] as String,
      json['userImg'] as String,
      json['userName'] as String,
      json['price'] as int,
      json['isDirectDeal'] as bool,
      json['isDelivery'] as bool,
    );

Map<String, dynamic> _$MarketToJson(Market instance) => <String, dynamic>{
      'itemThumnail': instance.itemThumnail,
      'itemTitle': instance.itemTitle,
      'userImg': instance.userImg,
      'userName': instance.userName,
      'price': instance.price,
      'isDirectDeal': instance.isDirectDeal,
      'isDelivery': instance.isDelivery,
    };
