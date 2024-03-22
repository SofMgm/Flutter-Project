import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/article-model.dart';



class ArticlesService{
  

  

  /// Fetch in API into take all articles
  /// synchrone query http get with url of API
  /// Take the body of response and decode for use it
  /// Map with Articles class for use article model file article-model.dart
  
  Future<List<Articles>> getAllArticles() async {
   
    final response = await http.get(Uri.parse('http://localhost:81/articles'));

    if(response.statusCode == 200){
      
      List<dynamic> data = jsonDecode(response.body);

      
      List<Articles> articlesList = data.map((article) => Articles.fromJson(article)).toList();
      return articlesList;
    
    } else {
      throw Exception('Error to load articles');
    }
    }

  /// Fetch in API into take a article by a id
  /// Asynchrone query http get with Params integer articleId
  /// Map it with Model Articles files article-model.dart
  
  Future<List<Articles>> getOneArticleById(int articleId) async {
    final artId = jsonEncode(articleId);
    final responsse = await http.get(Uri.parse('http://localhost:81/articles/$artId'));

    if(responsse.statusCode == 200){

      List<dynamic> data = jsonDecode(responsse.body);

      List<Articles> articleByIdList = data.map((article) => Articles.fromJson(article)).toList();
      return articleByIdList;

    } else {
      throw Exception('Error to load a article by this id');
    }
  }

  

}

