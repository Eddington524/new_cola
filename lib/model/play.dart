import 'package:json_annotation/json_annotation.dart';

part 'play.g.dart';

@JsonSerializable()

class Play {
  int? id;
  // @JsonKey(name: 'media_Thumbnail')
  String? mediaThumbnail;
  String? userImg;
  String? mediaUrl;

  Play(this.id, this.mediaThumbnail, this.mediaUrl, this.userImg);

  factory Play.fromJson(Map<String, dynamic> json) => _$PlayFromJson(json);

  Map<String, dynamic> toJson() => _$PlayToJson(this);
}
