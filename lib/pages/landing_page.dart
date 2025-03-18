
// ignore_for_file: duplicate_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

import 'package:news_app_/pages/home.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("News",
                style: TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold, fontSize: 30)),
            Text("App",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30)),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Center content vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center text horizontally
          children: [
            Material(
              elevation: 3.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                 imageUrl: "https://www.vskills.in/certification/blog/wp-content/uploads/2015/01/structure-of-a-news-report.jpg",
                 
                  height: MediaQuery.of(context).size.height / 1.8, // Reduced for better spacing
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
             RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                children: [
                  TextSpan(text: "Welcome to "),
                  TextSpan(text: "News", style: TextStyle(color: Colors.green)),
                  TextSpan(text: "App", style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Get the latest news from around the world in one place with News App.",
              textAlign: TextAlign.center, // Centers the text
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
             SizedBox(height: 20),
           
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                },backgroundColor: Colors.blue,
                child: Icon(Icons.arrow_forward_ios),
                ),
              );
            }
          }