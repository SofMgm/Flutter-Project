class Users{

  final int idUser;
  final String lastname;
  final String firstname;
  final String phone;
  final String mail;
  final String password;
  final String urlAvatar;

  const Users({

    required this.idUser,
    required this.firstname,
    required this.lastname,
    required this.mail,
    required this.password,
    required this.phone,
    required this.urlAvatar,
  });

  factory Users.fromJson(Map<String, dynamic> json){
    return Users(
      idUser: json['id_user'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      phone: json['phone'],
      mail: json['mail'],
      password: json['password'],
      urlAvatar: json['url_avatar']
    );
  }
}