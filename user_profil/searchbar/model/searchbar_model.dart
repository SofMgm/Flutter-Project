class Articles{

  final int idArticle;
  final String title;
  

  const Articles({required this.title, required this.idArticle});

  factory Articles.fromJson(Map<String, dynamic> json){
    return Articles(title: json['title'], idArticle: json['id_article']);
  }
}