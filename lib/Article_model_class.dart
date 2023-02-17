import 'package:untitled2/source_model_class.dart';

class Article
{
  Source? source;
  String? author;
  String? title;
  String? publishedAt;
  String? urlToImage;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.publishedAt,
    this.urlToImage,
    this.content
  });


  factory Article.fromJson(Map<String, dynamic> json){
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'],
      title: json['title'],
      publishedAt: json['publishedAt'],
      urlToImage: json['urlToImage'],
      content: json['content'],
    );
  }
}