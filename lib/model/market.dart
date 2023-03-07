import 'package:json_annotation/json_annotation.dart';

part 'market.g.dart';

@JsonSerializable()

class Market {
  final String itemThumnail;
  final String itemTitle;
  final String userImg;
  final String userName;
  final int price;
  final bool isDirectDeal;
  final bool isDelivery;

  Market(this.itemThumnail, this.itemTitle, this.userImg, this.userName,
      this.price, this.isDirectDeal, this.isDelivery);

  factory Market.fromJson(Map<String, dynamic> json) {
    return _$MarketFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MarketToJson(this);
}
