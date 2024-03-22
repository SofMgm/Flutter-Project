import 'package:http/http.dart' as http;
import '../model/article-model.dart';
import 'dart:convert';


class ArticlesServices {

  Future<List<Articles>> getAllArticles() async {
    final response = await http.get(Uri.parse('http://localhost:81/articles'));

    if(response.statusCode == 200){
      List<dynamic> articleData = jsonDecode(response.body);
      List<Articles> articleList = articleData.map((articles) => Articles.fromJson(articles)).toList();
      return articleList;

    } else {
      throw Exception('Failed to load title of article');
    }
  }

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

  Future<List<Articles>> getOneArticlesByTitle(String articleTitle) async {

    final response = await http.get(Uri.parse('http://localhost:81/articles/title/$articleTitle'));

    if(response.statusCode == 200){
      List<dynamic> data = jsonDecode(response.body);
      List<Articles> articlesTitleList = data.map((title) => Articles.fromJson(title)).toList();
      return articlesTitleList;

    } else {
      throw Exception('Error fetch title');
    }
  }
}