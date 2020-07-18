
class Article{
  String title;
  String description;
  String urlToImage;
  String author;

  Article({this.title, this.description, this.urlToImage, this.author});


  Article.fromJson(Map<String,dynamic> obj){
    this.title =obj['title'];
    this.description = obj['description'];
    this.urlToImage = obj['urlToImage'];
    this.author = obj['author'];
  }
}