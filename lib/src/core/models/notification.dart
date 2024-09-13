import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification {
  int? id;
  int? userId;
  String? message;
  bool? isRead;
  DateTime? createdAt;

  Notification({
    this.id,
    this.userId,
    this.message,
    this.isRead,
    this.createdAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}