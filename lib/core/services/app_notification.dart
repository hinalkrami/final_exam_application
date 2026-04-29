import 'dart:ui';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AppNotification {
  static final AppNotification _instance = AppNotification._internal();
  factory AppNotification() => _instance;
  AppNotification._internal();

  final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const AndroidInitializationSettings androidSetting = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const InitializationSettings settings = InitializationSettings(android: androidSetting);

    _notificationsPlugin.initialize(
      settings: settings,
      onDidReceiveNotificationResponse: (details) {
        print('Notification Tapped:${details.payload}');
      },
    );
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'Channel_Id',
      'Channel_Name',
      channelDescription: 'channelDescription',
      importance: .high,
      priority: .high,
      colorized: true,
      color: Color(0XFFeddfe6),
    );
    const NotificationDetails details = NotificationDetails(android: androidDetails);

    await _notificationsPlugin.show(
      id: id,
      title: title,
      body: body,
      payload: payload,
      notificationDetails: details,
    );
  }

  Future<void> cancelNotification(int id) async {
    await _notificationsPlugin.cancel(id: id);
  }

  Future<void> cancelAllNotification() async {
    await _notificationsPlugin.cancelAll();
  }

  Future<void> requestPermission() async {
    AndroidFlutterLocalNotificationsPlugin? android = _notificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await android?.requestNotificationsPermission();
  }
}
