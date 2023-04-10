import 'package:json_annotation/json_annotation.dart';

part 'recommend.g.dart';

@JsonSerializable()

class Recommend {
  final String tagImgUrl;
  final String tagName;
  final String userName;
  final int likeCount;
  final int collectionCount;

  Recommend(this.tagImgUrl, this.tagName, this.userName, this.likeCount, this.collectionCount);

  factory Recommend.fromJson(Map<String, dynamic> json) {
    return _$RecommendFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RecommendToJson(this);
}