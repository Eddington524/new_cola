import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()

class Banner {
  final int id;
  final String imgUrl;

  Banner(this.id, this.imgUrl);

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);

  Map<String, dynamic> toJson() => _$BannerToJson(this);
}
