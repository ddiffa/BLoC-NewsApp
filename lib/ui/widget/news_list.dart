import 'package:flutter/material.dart';
import 'package:news_api/bloc/news_bloc.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  NewsBloc _bloc;
  List _news;

  @override
  void initState() {
    _bloc = NewsBloc();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _news = _bloc.newsList;
    return Scaffold(
      appBar: AppBar(
        title: Text('News API'),
      ),
      body: Container(
        child: StreamBuilder(
          stream: _bloc.news,
          initialData: _news,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    elevation: 2.0,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16.0),
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(snapshot.data[index].urlToImage),
                      ),
                      title: Text(snapshot.data[index].title),
                      subtitle: Text(snapshot.data[index].description),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, index) => Divider(),
                itemCount:
                    (snapshot.data.length == null) ? 0 : snapshot.data.length);
          },
        ),
      ),
    );
  }
}
