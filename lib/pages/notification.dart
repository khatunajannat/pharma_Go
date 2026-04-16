import 'package:flutter/material.dart';
import '../model/notification_model.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<NotificationModel> notifications = [];

  @override
  void initState() {
    super.initState();
    notifications = NotificationModel.getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
        child: ListView.separated(
          itemCount: notifications.length,
          separatorBuilder: (_, __) => SizedBox(height: 20),
          itemBuilder: (context, index) {
            final notif = notifications[index];
            return Container(
              padding: EdgeInsets.all(12.0),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: notif.boxColor.withOpacity(0.10),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 50,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/napa.png'),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Text(notif.message),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}