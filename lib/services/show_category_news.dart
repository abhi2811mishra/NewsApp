import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:news_app_/models/show_category.dart';



class ShowCategoryNews {
  List<ShowCategoryModel> categories = [];

  Future<void> getCategoriesNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f8f5324cde2041b5af4d1df378f1f63b";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
        ShowCategoryModel categoryModel = ShowCategoryModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            author: element["author"],
            content: element["content"],

          );
          categories.add(categoryModel );
        }
      });
    }
    else{
      print("Error");
    }
  }
}