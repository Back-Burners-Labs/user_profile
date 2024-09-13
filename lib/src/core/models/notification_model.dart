import '../enums/notification_type_enum.dart';

class NotificationModel{
  int? id;
  NotificationType? type;
  String? desc;
  String? senderName;
  String? senderImagePath;
  DateTime? notificationTime;
  bool isRead;
  bool isFollowed;

  NotificationModel({
    this.id,
    this.type,
    this.desc,
    this.senderName,
    this.senderImagePath,
    this.notificationTime,
    this.isRead=false,
    this.isFollowed=false,
  });
}