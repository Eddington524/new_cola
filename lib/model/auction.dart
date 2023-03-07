import 'package:json_annotation/json_annotation.dart';

part 'auction.g.dart';

@JsonSerializable()

class Auction {
  final String itemThumnail;
  final String itemTitle;
  final String userImg;
  final String userName;
  final DateTime endAt;
  final int price;
  final String content;
  final int count;

  Auction(this.itemThumnail, this.itemTitle, this.userImg, this.userName, this.endAt, this.price, this.content, this.count);

  factory Auction.fromJson(Map<String, dynamic> json) {
    return _$AuctionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuctionToJson(this);
}
