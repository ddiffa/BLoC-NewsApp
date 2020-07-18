import 'dart:async';

import 'package:news_api/bloc/bloc.dart';
import 'package:news_api/source/api_helper.dart';

class NewsBloc implements Bloc {
  ApiHelper _api;
  List newsList;
  final _controller = StreamController.broadcast();

  Stream get news => _controller.stream;

  NewsBloc() {
    _api = ApiHelper();
    getAllArticle();
    _controller.stream.listen(returnNews);
  }

  Future getAllArticle() async {
    newsList = List();
    newsList = await _api.getNews();
    _controller.add(newsList);
  }

  List returnNews(news) {
    return news;
  }

  @override
  void dispose() {
    _controller.close();
  }
}
