import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news_api/model/article.dart';

class ApiHelper {
  final String _baseUrl = 'http://newsapi.org/';
  final String _path = 'v2/top-headlines';
  final String _query = '?sources=techcrunch&';
  final String _apiKey = 'apiKey=YOUR_API_KEY';

  Future getNews() async{
    final String url = _baseUrl + _path + _query + _apiKey;

    http.Response result = await http.get(url);

    if(result.statusCode == HttpStatus.ok){
      final jsonResponse = json.decode(result.body);
      final newsMap = jsonResponse['articles'];
      final news = newsMap.map((i)=> Article.fromJson(i)).toList();

      return news;
    }else{
      return null;
    }

  }
}