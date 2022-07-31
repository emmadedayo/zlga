// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:zlga/acadaar_ctrl/dr_url.dart';
//
// class MyNotification {
//
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
//
//   static Future<void> initialize(
//       FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
//     var androidInitialize = new AndroidInitializationSettings('app_icon');
//     var iOSInitialize = new IOSInitializationSettings();
//     var initializationsSettings = new InitializationSettings(
//         android: androidInitialize, iOS: iOSInitialize);
//     flutterLocalNotificationsPlugin.initialize(initializationsSettings);
//
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       print("onMessage: ${message.notification.body}");
//       //final String notificationMessage = parseMessageNotification(message.data);
//       //print("onMessage2: $notificationMessage");
//       MyNotification.showNotification(
//           message.data, flutterLocalNotificationsPlugin);
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print("onMessageApp: ${message.notification}");
//      // final String notificationMessage = parseMessageNotification(message.data);
//       MyNotification.showNotification(
//           message.data, flutterLocalNotificationsPlugin);
//     });
//   }
//
//
//   // static String parseMessageNotification(Map<String, dynamic> message) {
//   //   final dynamic data = message['notification'] ?? message;
//   //   String notificationMessage = '';
//   //   if (Platform.isAndroid) {
//   //     notificationMessage = message['data']['message'];
//   //     notificationMessage ??= '';
//   //   } else if (Platform.isIOS) {
//   //     notificationMessage = data['body'];
//   //     notificationMessage ??= data['message'];
//   //     notificationMessage ??= '';
//   //   }
//   //   return notificationMessage;
//   // }
//
//
//   static Future<void> showNotification(Map<String, dynamic> message, FlutterLocalNotificationsPlugin fln) async {
//     final dynamic data = message['notification'] ?? message;
//     print("onMessageAppdata: ${data}");
//       // if (Platform.isAndroid) {
//       //   final String flag = message['data']['flag']; //backend flag
//       //   final String notificationMessage = message['data']['message'];
//       //
//       //   if (flag == 'broadcast') {
//       //    // _onSelectNotification(context, notiMessage);
//       //   } else if (flag == 'transaction') {
//       //     final String orderId = message['data']['trans_header_id'] ?? '';
//       //    // _onOrderStatusChangeNotification(context, notiMessage, orderId);
//       //   }
//       // } else if (Platform.isIOS) {
//       //   final String flag = data['flag'];
//       //   String notificationMessage = data['body'];
//       //   notificationMessage ??= data['message'];
//       //   notificationMessage ??= '';
//       //
//       //   if (flag == 'broadcast') {
//       //     //_onSelectNotification(context, notiMessage);
//       //   } else if (flag == 'transaction') {
//       //     final String orderId = data['trans_header_id'] ?? '';
//       //     //_onOrderStatusChangeNotification(context, notiMessage, orderId);
//       //   } else {}
//       // }
//
//     if(message['image'] != null && message['image'].isNotEmpty) {
//       try{
//         await showBigPictureNotificationHiddenLargeIcon(message, fln);
//       }catch(e) {
//         await showBigTextNotification(message, fln);
//       }
//     }else {
//       await showBigTextNotification(message, fln);
//     }
//   }
//
//   static Future<void> showTextNotification(Map<String, dynamic> message,
//       FlutterLocalNotificationsPlugin fln) async {
//     String _title = message['title'];
//     String _body = message['body'];
//    // print("onMessage: ${_title}");
//     const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'com.acadaar.zlga', 'zlga', 'your channel description',
//       sound: RawResourceAndroidNotificationSound('slow_spring_board'),
//       importance: Importance.max,
//       playSound: true,
//       priority: Priority.high,
//       channelShowBadge: true,
//     );
//     const NotificationDetails platformChannelSpecifics = NotificationDetails(
//         android: androidPlatformChannelSpecifics);
//     await fln.show(0, _title, _body, platformChannelSpecifics, payload: '');
//   }
//
//   static Future<void> showBigTextNotification(Map<String, dynamic> message,
//       FlutterLocalNotificationsPlugin fln) async {
//     String _title = message['title'];
//     String _body = message['body'];
//     // String _orderID = message['order_id'];
//     BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
//       _body, htmlFormatBigText: true,
//       contentTitle: _title, htmlFormatContentTitle: true,
//     );
//     AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'com.acadaar.zlga', 'zlga', 'big text channel description',
//       sound: RawResourceAndroidNotificationSound('slow_spring_board'),
//       importance: Importance.max,
//       playSound: true,
//       priority: Priority.high,
//       channelShowBadge: true,
//       styleInformation: bigTextStyleInformation,
//     );
//     NotificationDetails platformChannelSpecifics = NotificationDetails(
//         android: androidPlatformChannelSpecifics);
//     await fln.show(0, _title, _body, platformChannelSpecifics, payload: '');
//   }
//
//   static Future<void> showBigPictureNotificationHiddenLargeIcon(
//       Map<String, dynamic> message, FlutterLocalNotificationsPlugin fln) async {
//     String _title = message['title'];
//     String _body = message['body'];
//     String _orderID = message['order_id'];
//     String _image = message['image'].startsWith('http') ? message['image']
//         : '${DrUrl
//         .sever_url}/storage/app/public/notification/${message['image']}';
//     final String largeIconPath = await _downloadAndSaveFile(
//         _image, 'largeIcon');
//     final String bigPicturePath = await _downloadAndSaveFile(
//         _image, 'bigPicture');
//     final BigPictureStyleInformation bigPictureStyleInformation = BigPictureStyleInformation(
//       FilePathAndroidBitmap(bigPicturePath), hideExpandedLargeIcon: true,
//       contentTitle: _title,
//       htmlFormatContentTitle: true,
//       summaryText: _body,
//       htmlFormatSummaryText: true,
//     );
//     final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'com.acadaar.zlga', 'zlga', 'big text channel description',
//       largeIcon: FilePathAndroidBitmap(largeIconPath),
//       priority: Priority.high,
//       sound: RawResourceAndroidNotificationSound('slow_spring_board'),
//       styleInformation: bigPictureStyleInformation,
//       importance: Importance.max,
//       playSound: true,
//       channelShowBadge: true,
//     );
//     final NotificationDetails platformChannelSpecifics = NotificationDetails(
//         android: androidPlatformChannelSpecifics);
//     await fln.show(
//         0, _title, _body, platformChannelSpecifics, payload: _orderID);
//   }
//
//   static Future<String> _downloadAndSaveFile(String url,
//       String fileName) async {
//     final Directory directory = await getApplicationDocumentsDirectory();
//     final String filePath = '${directory.path}/$fileName';
//     final Response response = await Dio().get(
//         url, options: Options(responseType: ResponseType.bytes));
//     final File file = File(filePath);
//     await file.writeAsBytes(response.data);
//     return filePath;
//   }
//
//   static Future<dynamic> saveDeviceToken() async {
//     FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//     final String fcmToken = await _firebaseMessaging.getToken();
//     print(fcmToken);
//     return fcmToken;
//   }
//
// }
//
// Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
//   print('backgroundMsg: ${message.data}');
//   var androidInitialize = new AndroidInitializationSettings('app_icon');
//   var iOSInitialize = new IOSInitializationSettings();
//   var initializationsSettings = new InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   flutterLocalNotificationsPlugin.initialize(initializationsSettings);
//   MyNotification.saveDeviceToken();
//   //final String notificationMessage = MyNotification.parseMessageNotification(message.data);
//   //print('onBackgroundMessage: $notificationMessage');
//   MyNotification.showNotification(message.data, flutterLocalNotificationsPlugin);
// }