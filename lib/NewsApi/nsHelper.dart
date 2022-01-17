import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_news_app/NewsApi/newsapi.dart';

class nsHelper {
  List<Articles> articleList = <Articles>[];
  String apiurl =
  "https://newsapi.org/v2/everything?q=apple&from=2022-01-10&to=2022-01-10&sortBy=popularity&apiKey=c85d9a9d49af4777b36bb484ae8ea658";



  Future getArticles() async{
    var respons = await http.get(Uri.parse(apiurl));
    var jsonData = jsonDecode(respons.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        Articles articles = Articles(
          element['author'] ?? "",
          element['title'] ?? "",
          element['description'] ?? "",
          element['url'] ?? "",
          element['urlToImage'] ?? "",
          element['publishedAt'] ?? "",
          element['content'] ?? "",
        );
        articleList.add(articles);
      });
    };
  }
}
