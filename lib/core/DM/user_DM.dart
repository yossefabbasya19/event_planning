class UserDm {
  static UserDm? currentUser;
  final String userID;
  final String userName;
  final String email;
   List<String> favoritesList;

  UserDm({
    required this.userID,
    required this.userName,
    required this.email,
    required this.favoritesList,
  });

  factory UserDm.fromJson(json) {
    return UserDm(
      userID: json["userID"],
      userName: json['userName'],
      email: json['email'],
      favoritesList: (json['favoritesList']as List<dynamic>).map((e) => e.toString(),).toList(),
    );
  }
  Map<String, dynamic> toJson(){
    return{
      "userID":userID,
      "userName":userName,
      "email":email,
      "favoritesList":favoritesList,
    };
  }
}
