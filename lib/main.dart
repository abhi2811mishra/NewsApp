import 'package:flutter/material.dart';
import 'package:news_app_/pages/home.dart';
import 'package:news_app_/pages/landing_page.dart';

      // Android




void main() {
  
 

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
