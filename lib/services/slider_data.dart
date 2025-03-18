

import 'dart:convert';


import 'package:http/http.dart' as http;

import 'package:news_app_/models/slider_model.dart';

class Slider {
  List<SliderModel> sliders = [];

  Future<void> getSlider() async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f8f5324cde2041b5af4d1df378f1f63b";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          SliderModel slidermodel = SliderModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            author: element["author"],
            content: element["content"],

          );
          sliders.add(slidermodel);
        }
      });
    }
    else{
      print("Error");
    }
  }
}
