import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled2/Article_model_class.dart';

class ApiService
{
  Future<List<Article>> getArticle() async{
    final url = 'https://newsapi.org/v2/everything?q=Apple&from=2023-02-16&sortBy=popularity&apiKey=0bf218c89ece4ea6b6a49dd633c12fd7';
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var body = json.decode(response.body);
      List<Article> _data = List<Article>.from(
          body['articles'].map((e) => Article.fromJson(e)).toList());

      // print(body);

      return _data;

    }
    else{
      List<Article> _data = [];
      return _data;
    }
  }
}