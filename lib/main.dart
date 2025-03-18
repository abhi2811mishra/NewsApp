import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app_/firebase_options.dart';
import 'package:news_app_/pages/home.dart';
import 'package:news_app_/pages/landing_page.dart';

// Android

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter bindings are initialized

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Load Firebase config
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: LandingPage()
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(), // Home Page
        '/second': (context) => Home(), // Another page for navigation
      },
    );
  }
}
