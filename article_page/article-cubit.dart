import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/article-model.dart';
import '../repository/article-repo.dart';


class ArticlesCubit extends Cubit<List<Articles>> {
  // We use the class ArticlesServices for use method to fetch API
  final ArticlesService _articlesService;
   
  
  ArticlesCubit(this._articlesService) : super([]);

  // Method fetchArticles use ArticlesServices.method : getAllArticles
  // Return expected : all property of articles class files article-model.dart
   void fetchArticles() async {
    try{
      final List<Articles> articlesList = await _articlesService.getAllArticles();
      emit(articlesList);
    } catch(e){
      print('Error fetching articles -> $e');
    }
  }

  // Method for fetch a article by id(Params articleId) use method fetch from ArticlesServices = getOneArticleById
  // Return expected : all property of articles class for one articles class files article-model.dart

  fetchArticlesById(int articleId) async {
    
    
    try{
      final List<Articles> articlesByIdList = await _articlesService.getOneArticleById(articleId);
      emit(articlesByIdList);

    } catch(e){
      print('Error fetching article by this id -> $e');
    }
  }
}