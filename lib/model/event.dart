
import 'package:json_annotation/json_annotation.dart';
import 'package:new_cola/model/comment.dart';
part 'event.g.dart';

@JsonSerializable()

class Event {
  final int id;
  final String detailImgUrl;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime prizeDate;
  final List<Comment> commentList;

  Event(this.id, this.detailImgUrl, this.startDate, this.endDate, this.prizeDate, this.commentList);

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
