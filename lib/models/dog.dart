class Dog{
  final int id;
  final String password;
  final String userName;
  final String userId;
  final String token;
  final int isLoginEnded;

  Dog({this.id, this.password,this.userName, this.isLoginEnded,this.userId, this.token});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'password': password,
      'userName': userName,
      'userId': userId,
      'isLoginEnded': isLoginEnded,
      'token': token,
    };
  }
  factory Dog.fromJson(Map<String,dynamic> json){
    return Dog(
      id: json["id"],
      password: json["password"],
      userName: json["userName"],
      userId: json["userId"],
      token: json["token"],
      isLoginEnded: json["isLoginEnded"],
    );
  }
  @override
  String toString() {
    return 'Dog{id: $id, password: $password,userName: $userName,isLoginEnded: $isLoginEnded,userId: $userId,token: $token}';
  }
}