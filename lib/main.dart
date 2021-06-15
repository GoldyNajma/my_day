import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:my_day/common/theme.dart';
import 'package:my_day/modules/splash_screen.dart';
import 'package:overlay_support/overlay_support.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
  if (message.notification != null) {
    print(
        'Message also contained a notification: ${message.notification!.body}');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    // showSimpleNotification(
    //     Text("Notifikasi Masuk"),
    //     position: NotificationPosition.top,
    //     subtitle: Text(message.notification!.body!),

    // background: Colors.green);
    showOverlayNotification((context) {
      return SafeArea(
        child: Card(
            elevation: 4,
            color: Colors.blue[50],
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: ListTile(
              leading: Icon(Icons.message),
              title: Text(message.notification!.title!),
              // subtitle: Text(message.notification!.body!),
            )),
      );
    });
  });

  FirebaseMessaging.instance.getToken().then((value) => print(value));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
        child: MaterialApp(
      title: 'My Day',
      theme: getThemeData(),
      home: const SplashScreen(),
    ));
  }
}
