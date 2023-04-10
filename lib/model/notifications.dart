import 'package:json_annotation/json_annotation.dart';

part 'notifications.g.dart';

@JsonSerializable()

class Notifications {
  final String imageUrl;
  final String title;
  final String createdAt;
  final String sideImageUrl;

  Notifications(this.imageUrl, this.title, this.createdAt, this.sideImageUrl);

  factory Notifications.fromJson(Map<String, dynamic> json) => _$NotificationsFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsToJson(this);
}
