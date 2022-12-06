import 'dart:convert';

import '../model/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];
  Future<void> getNews() async{
    String url="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e0a3d62c74f346679669caa508911f52";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!=null && element['description']!=null) {
          ArticleModel art = ArticleModel(
              element["author"],
              element['title'],
              element["description"],
              element["url"],
              element["urlToImage"],
              element["content"]);
          news.add(art);
        }
      });
    }
  }
}