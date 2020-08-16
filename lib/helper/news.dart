import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url = 'http://newsapi.org/v2/top-headlines?country=in&apiKey=7b298ae579c14a87abecb0d802b49dc7';
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        ArticleModel articleModel = ArticleModel(
          title: element['title'],
          author: element['author'],
          description: element['description'],
          url: element['url'],
          urlToImage: element['urlToImage'],

          content: element['context'],

        );
        news.add(articleModel);
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url = 'http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=7b298ae579c14a87abecb0d802b49dc7';
    var response= await http.get(url);
    var jsonData =jsonDecode(response.body);
    if(jsonData['status']=='ok'){
    jsonData['articles'].forEach((element){
    ArticleModel articleModel = ArticleModel(
    title: element['title'],
    author: element['author'],
    description: element['description'],
    url: element['url'],
    urlToImage: element['urlToImage'],

    content: element['context'],

    );
    news.add(articleModel);
    });
    }

  }
}