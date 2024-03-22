import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/article-model.dart';
import '../repository/article-repo.dart';


class ArticlesCubit extends Cubit<List<Articles>>{
  final ArticlesServices _articlesService;

  ArticlesCubit(this._articlesService) : super([]);

  fetchAllArticles() async {
    try{
      final List<Articles> articlesList = await _articlesService.getAllArticles();
      emit(articlesList);

    } catch(e){
      print('Error to fetch all articles error: $e');
    }
  }

  fetchArticlesById(int articleId) async {
    
    
    try{
      final List<Articles> articlesByIdList = await _articlesService.getOneArticleById(articleId);
      emit(articlesByIdList);

    } catch(e){
      print('Error fetching article by this id -> $e');
    }
  }

  fetchArticlesByTitle(String articleTitle) async {
    try{
      final List<Articles> articlesTitleList = await _articlesService.getOneArticlesByTitle(articleTitle);
      emit(articlesTitleList);

    } catch(e){
      print('Error to fetch title article : $e');
    }
  }

}