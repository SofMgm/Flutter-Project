import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_disleur/main.dart';
import 'package:frontend_disleur/pages/searchbar/model/article-model.dart';
import 'package:frontend_disleur/pages/searchbar/repository/article-repo.dart';
import '../../../widget/drawer.dart';
import '../bloc/article-cubit.dart';


class SearchBarApp extends StatefulWidget{
  const SearchBarApp({super.key});

  @override
  _SearchBarAppState createState() => _SearchBarAppState();
}



class _SearchBarAppState extends State<SearchBarApp>{
  var  _searchTitle ;
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 5,
        title: Image.asset('./lib/assets/pictures/logo_disleur.png',
          alignment: Alignment.center,
          fit: BoxFit.contain,
        ),
        leading:  IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ArticlesCubit, List<Articles>>(
        builder: (context, articlesTitleList){
          if(articlesTitleList.isEmpty){
            return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchAnchor(
                builder: (BuildContext context, SearchController controller){
                  return SearchBar(
                    controller: controller,
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    onTap: () {
                      controller.openView();
                    },
                    onChanged: (_) {
                      controller.openView();
                      _searchTitle = controller.value.toString();
                      BlocProvider.of<ArticlesCubit>(context).fetchArticlesByTitle(_searchTitle);
                    },
                    leading:  IconButton(
                      onPressed: () {
                      }, 
                      icon: const Icon(
                        Icons.search,
                      ),
                    ),
                  );
                },
                suggestionsBuilder: (BuildContext context, SearchController controller){
                  return List<ListTile>.generate(10, (int index) {
                    final item = articlesTitleList;
                    return ListTile(
                      title: Text(item[index].title),
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailArticlePage(idArt: item[index].idArticle)));

                      },
                    );
                  });
                },
                ),
            );
          }
        },
      ),
      
    );
  }
}
