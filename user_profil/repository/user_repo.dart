import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/user-model.dart';



class UsersService{
  

  

  /// Fetch in API into take all articles
  /// synchrone query http get with url of API
  /// Take the body of response and decode for use it
  /// Map with Articles class for use article model file article-model.dart
  
  Future<List<Users>> getAllUsers() async {
   
    final response = await http.get(Uri.parse('http://localhost:81/users'));

    if(response.statusCode == 200){
      
      List<dynamic> data = jsonDecode(response.body);

      
      List<Users> usersList = data.map((user) => Users.fromJson(user)).toList();
      return usersList;
    
    } else {
      throw Exception('Error to load articles');
    }
    }

  /// Fetch in API into take a article by a id
  /// Asynchrone query http get with Params integer articleId
  /// Map it with Model Articles files article-model.dart
  
  Future<List<Users>> getOneUserById(int userId) async {
    final usrId = jsonEncode(userId);
    final responsse = await http.get(Uri.parse('http://localhost:81/users/$usrId'));

    if(responsse.statusCode == 200){

      List<dynamic> data = jsonDecode(responsse.body);

      List<Users> userByIdList = data.map((user) => Users.fromJson(user)).toList();
      return userByIdList;

    } else {
      throw Exception('Error to load a article by this id');
    }
  }

  
  Future updateUser(int userId, String userLastname, String userFirststname, String userMail, String userPassword) async {
    final usrUptId = jsonEncode(userId);
    final response = await http.put(Uri.parse('http://localhost:81/users/$usrUptId'), 
                    headers: {"Content-type": "application/json", "Accept": "application/json"},
                    body: jsonEncode({'lastname' : userLastname, 'firstname' : userFirststname, 'mail': userMail, 'password' : userPassword}),
                  );
    
    if(response.statusCode == 200) {
      
      return ('Vos données ont été modifiées avec succès !');
    } else {
      throw Exception('Error updating user with this id');
    }

  }

  

}

