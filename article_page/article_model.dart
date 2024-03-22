

class Articles {
  final int idArticle;
  final String title;
  final String text;
  final String date;
  final int likeQty;
  final int shareQty;
  final int stateArticle;
  final String lastname;
  final String firstname;
  final String pictureTitle;
  final String legend;
  final String url;
  final String metaData;
  final String category;
  


  const Articles({
    required this.idArticle,
    required this.title,
    required this.text,
    required this.lastname,
    required this.firstname,
    required this.pictureTitle,
    required this.legend,
    required this.metaData,
    required this.date,
    required this.likeQty,
    required this.shareQty,
    required this.stateArticle,
    required this.url,
    required this.category,
  });

  factory Articles.fromJson(Map<String, dynamic> json){
    return Articles(
      idArticle: json['id_article'],
      title: json['title'],
      text: json['text'],
      date: json['date'],
      likeQty: json['like_qty'],
      shareQty: json['share_qty'],
      stateArticle: json['state_article'],
      lastname: json['lastname'],
      firstname: json['firstname'],
      pictureTitle: json['picture_title'],
      legend: json['legend'],
      metaData: json['meta_data'],
      url: json['url'],
      category: json['name'],
      
    );
  }
}