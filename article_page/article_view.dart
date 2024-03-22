import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/article-model.dart';
import '../bloc/article-cubit.dart';


class DetailArticlePage extends StatefulWidget {
  const DetailArticlePage({super.key, required this.idArt});

  final int idArt;

  @override
  State<DetailArticlePage> createState() => _DetailArticlePageState();

  State<DetailArticlePage> initState() => _DetailArticlePageState();
}

class _DetailArticlePageState extends State<DetailArticlePage> {
  late ArticlesCubit _articlesCubit;

  @override
  void initState() {
    super.initState();

    _articlesCubit = BlocProvider.of<ArticlesCubit>(context);
    _articlesCubit.fetchArticlesById(widget.idArt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(255, 7, 7, 7),
        elevation: 3,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Image.asset(
          './assets/picture/logo_disleur.png',
          alignment: Alignment.center,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          // padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          child: Column(
            children: [
            Image.asset(
              './assets/picture/disleur_slogan.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(
                  height: 5.0,
            ),
            // Image.network('https://images.pexels.com/photos/302083/pexels-photo-302083.jpeg?auto=compress&cs=tinysrgb&w=600',
            // fit: BoxFit.cover,
            // ),
            SizedBox(
              height: 2000,
              child: BlocBuilder<ArticlesCubit, List<Articles>>(
                builder: (context, articleList) {
                  if (articleList.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: articleList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          titleAlignment: ListTileTitleAlignment.threeLine,
                          textColor: Colors.black,
                          minVerticalPadding: 10,
                          title: Text(
                            articleList[0].category,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(articleList[0].title,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                            ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Image.network('https://images.pexels.com/photos/302083/pexels-photo-302083.jpeg?auto=compress&cs=tinysrgb&w=600',
                                  fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                        height: 10.0,
                                  ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                                  Text(
                                    'Rédigé par : ${articleList[0].lastname} ${articleList[0].firstname}',
                                    style: const TextStyle(
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    'Publié le : ${articleList[0].date}',
                                    style: const TextStyle(
                                      color: Colors.black87,
                                    ),
                                  ),
                              //   ],
                              // ),
                              const SizedBox(
                                        height: 20.0,
                                  ),
                              Text(
                                articleList[0].text,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                        height: 20.0,
                                  ),
                              const Divider(
                                color: Colors.grey,
                              ),
                              // const IconRow(),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    IconButton(
                                      hoverColor: Colors.amber[300],
                                        onPressed: () {
                                          const Icon(Icons.favorite_outlined);
                                          //BlocProvider.of<ArticlesCubit>(context).fetchSetLikeArticle()??;
                                          // Create method for increment likeQty in Articles class
                                        },
                                        icon: const Icon(
                                          Icons.favorite_outline_outlined,
                                        )
                                        ),
                                    Text('${articleList[0].likeQty}'),
                                    IconButton(
                                      hoverColor: Colors.amber[300],
                                      icon: const Icon(
                                        Icons.chat_rounded,
                                      ),
                                      onPressed: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
                                      },
                                    ),
                                    Text('${articleList[0].likeQty}'),
                                    IconButton(
                                      hoverColor: Colors.amber[300],
                                      icon: const Icon(
                                        Icons.star_border,
                                      ),
                                      onPressed: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
                                        const Icon(Icons.star);
                                      },
                                    ),
                                    IconButton(
                                      hoverColor: Colors.amber[300],
                                      icon: const Icon(
                                        Icons.share,
                                      ),
                                      onPressed: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
                                      },
                                    ),
                                    Text('${articleList[0].shareQty}'),
                                  ]),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

