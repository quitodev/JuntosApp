part of 'models.dart';

class NotificationModel extends Notification {
  const NotificationModel({
    required super.id,
    required super.body,
    required super.userId,
    required super.institutionId,
    required super.publish,
    required super.createdAt,
    required super.updatedAt,
  });

  factory NotificationModel.fromEntity(Notification notification) {
    return NotificationModel(
      id: notification.id,
      body: notification.body,
      userId: notification.userId,
      institutionId: notification.institutionId,
      publish: notification.publish,
      createdAt: notification.createdAt,
      updatedAt: notification.updatedAt,
    );
  }

  factory NotificationModel.fromJson(dynamic json) {
    String getDateFormatted(String date) {
      final newDate = DateTime.parse(date.replaceAll('.000', ''));
      return '${newDate.day}.${newDate.month}.${newDate.year}';
    }

    return NotificationModel(
      id: json['id'] == null ? '' : json['id'] as String,
      body: json['body'] == null ? '' : json['body'] as String,
      userId: json['userId'] == null ? '' : json['userId'] as String,
      institutionId:
          json['institutionId'] == null ? '' : json['institutionId'] as String,
      publish: json['publish'] == null ? '' : json['publish'].toString(),
      createdAt: json['createdAt'] == null
          ? ''
          : getDateFormatted(json['createdAt'].toString()),
      updatedAt: json['updatedAt'] == null
          ? DateTime.now()
          : DateTime.parse(json['updatedAt'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'body': body,
      'userId': userId,
      'institutionId': institutionId,
      'publish': publish,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

extension NotificationMapper on NotificationModel {
  Notification toEntity() {
    return Notification(
      id: id,
      body: body,
      userId: userId,
      institutionId: institutionId,
      publish: publish,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
