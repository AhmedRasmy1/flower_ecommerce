class NotificationsListEntity {
  NotificationsListEntity({
    this.message,
    this.notifications,
  });

  String? message;
  List<NotificationsEntity>? notifications;
}

class NotificationsEntity {
  NotificationsEntity({
    this.id,
    this.title,
    this.body,
  });

  String? id;
  String? title;
  String? body;
}

