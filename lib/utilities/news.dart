import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/article_model.dart';

class News {
  List<ArticleModel> news = [];
  String country;
  String category;
  String keyWord;
  News({
    required this.country,
    required this.category,
    required this.keyWord,
  });
  Future<void> getNews() async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=d316c9930a2c4125bfcde06e086387ed");

    http.Response? responses;

    try {
      responses = await http.get(url);
      debugPrint(json.decode(json.encode(responses.body)));
    } catch (e) {
      debugPrint("$e for $category");
    }
    String? jsonStringData = json.decode(json.encode(responses?.body));
    Map? jsonData = jsonDecode(jsonStringData.toString());

    if (jsonData != null) {
      if (jsonData["status"] == "ok") {
        jsonData["articles"].forEach((element) {
          if (element["urlToImage"] != null &&
              element["description"] != null &&
              element["author"] != null &&
              element["content"] != null &&
              element["url"] != null &&
              element["title"] != null) {
            ArticleModel articleModel = ArticleModel(
              title: element["title"],
              url: element["url"],
              author: element["author"],
              content: element["content"],
              description: element["description"],
              urlToImage: element["urlToImage"],
            );
            news.add(articleModel);
          }
        });
        debugPrint("Fetched 'newsapi.org' for $category");
      }
    }
  }
}
