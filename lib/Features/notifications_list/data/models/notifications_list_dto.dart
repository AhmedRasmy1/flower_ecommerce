import 'package:flower_ecommerce/Features/notifications_list/domain/entities/notifications_list_entity.dart';

class NotificationsListDto {
  NotificationsListDto({
      this.message,
      this.metadata,
      this.notifications,});

  NotificationsListDto.fromJson(dynamic json) {
    message = json['message'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['notifications'] != null) {
      notifications = [];
      json['notifications'].forEach((v) {
        notifications?.add(Notifications.fromJson(v));
      });
    }
  }
  String? message;
  Metadata? metadata;
  List<Notifications>? notifications;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (notifications != null) {
      map['notifications'] = notifications?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  NotificationsListEntity toNotificationsListEntity(){
    return NotificationsListEntity (
      message: message,
      notifications: notifications?.map((notification) => notification.toNotificationsEntity()).toList(),

    );
}

}

class Notifications {
  Notifications({
      this.id,
      this.title,
      this.body,
      this.createdAt,
      this.updatedAt,
      this.v,});

  Notifications.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    body = json['body'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? title;
  String? body;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['body'] = body;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

  NotificationsEntity toNotificationsEntity(){
    return NotificationsEntity(
      id: id,
      body: body,
      title: title
    );
  }

}

class Metadata {
  Metadata({
      this.currentPage,
      this.numberOfPages,
      this.limit,});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }

}