// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auction _$AuctionFromJson(Map<String, dynamic> json) => Auction(
      json['itemThumnail'] as String,
      json['itemTitle'] as String,
      json['userImg'] as String,
      json['userName'] as String,
      DateTime.parse(json['endAt'] as String),
      json['price'] as int,
      json['content'] as String,
      json['count'] as int,
    );

Map<String, dynamic> _$AuctionToJson(Auction instance) => <String, dynamic>{
      'itemThumnail': instance.itemThumnail,
      'itemTitle': instance.itemTitle,
      'userImg': instance.userImg,
      'userName': instance.userName,
      'endAt': instance.endAt.toIso8601String(),
      'price': instance.price,
      'content': instance.content,
      'count': instance.count,
    };
