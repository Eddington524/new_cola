import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable()

class Tag {
  final String tagImgUrl;
  final String tagName;
  final String userName;
  final int likeCount;
  final int collectionCount;

  Tag(this.tagImgUrl, this.tagName, this.userName, this.likeCount, this.collectionCount);

  factory Tag.fromJson(Map<String, dynamic> json) {
    return _$TagFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TagToJson(this);
}