import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future _notificationDetails() async {
   return NotificationDetails(
       android: AndroidNotificationDetails(
         'channel id',
         'channel name',
         channelDescription: 'channel description',
         importance: Importance.max
       ),
       iOS: IOSNotificationDetails()
   );
}

  static Future init({bool initScheduled = false}) async {
    final android = AndroidInitializationSettings('@mipmap/ic_stat_logo');
    final ios = IOSInitializationSettings();

    final initializationSettings = InitializationSettings(
      android: android,
      iOS: ios
    );

    await _notifications.initialize(
        initializationSettings,
      onSelectNotification: (payload) async {
          onNotifications.add(payload);
      },
    );
}

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(
          id,
          title,
          body,
          await _notificationDetails(),
          payload: payload);


}