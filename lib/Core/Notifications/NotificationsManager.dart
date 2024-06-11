import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

NotificationsManager injectNotificationsManager() {
  return NotificationsManager.getInstance();
}

class NotificationsManager {
  NotificationsManager._();

  static NotificationsManager? instance;

  static NotificationsManager getInstance() {
    return instance ??= NotificationsManager._();
  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('splash');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  Future selectNotification(String payload) async {
    //Handle notification tapped logic here
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  Future<void> showNotifications(
    String title,
    String body,
  ) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('1', 'sbsr',
            channelDescription: 'Bus Stop Reminder',
            channelShowBadge: true,
            color: Color(0xFF29384D),
            colorized: true,
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker',showWhen: true);
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(0, body,
        "your Bus Has arrived to $title", notificationDetails,
        payload: 'sbsr');
  }
}
