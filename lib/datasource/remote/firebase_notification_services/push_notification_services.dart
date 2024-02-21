import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart';
import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/feature/models/user_model.dart';

class FireNotification {
  static String? fCMToken;

  static final messaging = FirebaseMessaging.instance;
  static Future<void> initNotifications() async {
    await messaging.requestPermission();
    try {
      await messaging.getToken().then((value) {
        if (value != null) {
          print('Notification Token: $value');
          fCMToken = value;
          FirebaseProvider.updatePushToken();
        }
      });
    } catch (e) {
      print('Token Error: $e');
    }
  }

  static var serverKey =
      'AAAAexMPcEk:APA91bFdBCbTSViQGO9YWsMMRtwio1oU4vAq6VwbOxR5UAQ62kVpuLjszbgTcib8K79g-v6WUCjX8P-dulnu3AG8axv51dOofwzbdJsDuKhMkOR9PMr6TxiJtXlOOcq2Mc43S1JFr-Pr';
  static sendPushNotification(
      {required UserModel user, required String message}) async {
    try {
      Uri uri = Uri.parse('https://fcm.googleapis.com/fcm/send');
      final bodys = {
        "to": user.pushToken,
        "notification": {"title": "${user.name}", "body": "${message}"}
      };
      var res = await post(uri, body: jsonEncode(bodys), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'key=${serverKey}',
      });
      print('Body : ${res.body}');
      print("status Code:${res.statusCode}");
    } catch (e) {
      print('Push Notification Error:$e');
    }
  }
}
