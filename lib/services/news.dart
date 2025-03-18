
// ignore_for_file: unused_local_variable

import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:news_app_/models/article_modle.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=f8f5324cde2041b5af4d1df378f1f63b";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            author: element["author"],
            content: element["content"],

          );
          news.add(articleModel);
        }
      });
    }
    else{
      print("Error");
    }
  }
}
