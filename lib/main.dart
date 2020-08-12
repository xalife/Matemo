import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matemo/videocall.dart';

import 'bilgi_yarismasi.dart';
import 'example.dart';
import 'giris.dart';
import 'havuz.dart';
import 'ilgi_alanin.dart';
import 'kayit.dart';
import 'profil.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }

  // Or do other work.
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "giris",
      routes: {
        "video": (context) => GetUserMediaSample(),
        "havuz": (context) => Havuz(),
        "profil": (context) => Profil(),
        "kayit": (context) => Kayit(),
        "dersler": (context) => Dersler(),
        "bilgi": (context) => Bilgi(),
        "giris": (context) => Giris(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          elevation: 0,
          color: ThemeData.light().canvasColor,
        ),
      ),
      home: Profil(),
    );
  }
}
