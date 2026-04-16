import 'package:flutter/material.dart';

class NotificationModel {
  String message;
  Color boxColor;

  NotificationModel({
    required this.message,
    required this.boxColor,
  });

  static List<NotificationModel> getNotifications() {
    return [
      NotificationModel(
        message: 'New order received from Rahim Uddin',
        boxColor: Colors.orange,
      ),
      NotificationModel(
        message: 'Order #ORD002 is now shipping',
        boxColor: Colors.blue,
      ),
      NotificationModel(
        message: 'Product stock running low: Napa Extend',
        boxColor: Colors.red,
      ),
      NotificationModel(
        message: 'Order delivered successfully',
        boxColor: Colors.green,
      ),
    ];
  }
}