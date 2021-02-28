import 'package:instanews/pages/login.dart';
import 'package:instanews/pages/profile_page.dart';

import 'package:instanews/pages/saved_news_page.dart';
import 'package:instanews/pages/settings_pages.dart';
import 'package:instanews/pages/sources_page.dart';
import 'package:instanews/pages/splash_screen.dart';
import 'package:instanews/pages/about.dart';
import 'package:flutter/material.dart';
import 'pages/profile_page.dart';
import 'pages/saved_news_page.dart';
import 'pages/sources_page.dart';
import 'pages/settings_pages.dart';
import 'pages/contact.dart';
import 'pages/about.dart';
import 'pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InstaNews',
      home: SplashScreen(),
      routes: {
        '/sources': (context) => SourcesPage(),
        '/profile': (context) => ProfilePage(),
        '/savedNews': (context) => SavedNewsPage(),
        '/settings': (context) => SettingScreen(),
        '/contactus': (context) => Contact(),
        '/about': (context) => About(),
        '/login': (context) => LoginPage()
      },
    );
  }
}
