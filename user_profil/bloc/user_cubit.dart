import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/user-model.dart';
import '../repository/user-repo.dart';


class UsersCubit extends Cubit<List<Users>> {
  // We use the class ArticlesServices for use method to fetch API
  final UsersService _articlesService;
   
  
  UsersCubit(this._articlesService) : super([]);

  // Method fetchArticles use ArticlesServices.method : getAllArticles
  // Return expected : all property of articles class files article-model.dart
   void fetchUsers() async {
    try{
      final List<Users> usersList = await _articlesService.getAllUsers();
      emit(usersList);
    } catch(e){
      print('Error fetching articles -> $e');
    }
  }

  // Method for fetch a article by id(Params articleId) use method fetch from ArticlesServices = getOneArticleById
  // Return expected : all property of articles class for one articles class files article-model.dart

  fetchUserById(int userId) async {
    
    
    try{
      final List<Users> articlesByIdList = await _articlesService.getOneUserById(userId);
      emit(articlesByIdList);

    } catch(e){
      print('Error fetching article by this id -> $e');
    }
  }
}