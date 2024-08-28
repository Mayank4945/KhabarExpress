import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:math';

import 'package:khabar_express/model/newsArt.dart';
class FetchNews{
  static Future<NewsArt> fetchNews() async{
    Response response = await get(Uri.parse('https://newsapi.org/v2/top-headlines?country=in&apiKey=ac16887bce694df3aabf0c1513ffc765'));
    Map body_data= jsonDecode(response.body);
    List articles = body_data['articles'];
    final _random = new Random();
    var myArticle = articles[_random.nextInt(articles.length)];
    print(myArticle);
    return NewsArt.fromAPItoApp(myArticle);
  }
}