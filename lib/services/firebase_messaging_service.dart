import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import './notification_service.dart';

import 'package:http/http.dart' as http;


class FirebaseMessagingService  with ChangeNotifier{
  final NotificationService _notificationService;

  FirebaseMessagingService(this._notificationService);

  String? _token;

  Future<void> initialize() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      badge: true,
      sound: true,
      alert: true,
    );
    getDeviceFirebaseToken();
    _onMessage();
    _onMessageOpenedApp();
    
  }
  String constructFCMPayload(String? token, String title, String body) {
  
  
  return jsonEncode({
    'token': token,
    'data': {
      'via': 'FlutterFire Cloud Messaging!!!',
      
    },
    'notification': {
      'title': title,
      'body': body,
    },
  });
}

Future<void> sendPushMessage(String title, String body) async {

  /*
   if (_token == null) {
      print('Unable to send FCM message, no token exists.');
     // return;
    }

    try {
      String accessToken = 'AAAAeSiPnUw:APA91bG-9vIbS2Hs_8pQt6GNSKTsvdoTmZtMZnwXdcR6FwjRo4vY_6Xt4xpwH10I-TddLjpP7K60cPWfzTEDmPTNmqn_X8FvDsi8QCfA4qiIC5wRVIcpg6EoP2Agn6c__8teNh11rPsj';
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'key=${accessToken}'
        },
        body: constructFCMPayload(_token, title, body),
      );
      print('FCM request for device sent!');
    } catch (e) {
      print(e);
    }
  */ 
     
  if (_token == null) {
      print('Unable to send FCM message, no token exists.');
     // return;
    }

    try {
      String accessToken = 'f2fb1b08982a5fd1069375ab79fa9dcb3121f857';
      await http.post(
        Uri.parse('https://fcm.googleapis.com/v1/projects/zeder-8cd2c/messages:send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${accessToken}'
        },
        body: constructFCMPayload(_token, title, body),
      );
      print('FCM request for device sent!');
    } catch (e) {
      print(e);
    }
  }


  getDeviceFirebaseToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    debugPrint('=======================================');
    debugPrint('TOKEN: $token');
    debugPrint('=======================================');

    _token = token;
    
  }

  _onMessage() {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        _notificationService.showLocalNotification(
          CustomNotification(
            id: android.hashCode,
            title: notification.title!,
            body: notification.body!,
            payload: message.data['route'] ?? '',
          ),
        );
      }
    });
  }

  _onMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen(_goToPageAfterMessage);
  }

  _goToPageAfterMessage(message) {
    final String route = message.data['route'] ?? '';
    if (route.isNotEmpty) {
      //Routes.navigatorKey?.currentState?.pushNamed(route);
    }
  }
}