class UserModel {
  final String uid;
  final String username;
  final String email;


  const UserModel({
    required this.uid ,
    required this.username,
    required this.email,
});

  toJson(){
    return{
      "Username": username,
      "Email": email,
      "Uid": uid,
    };
  }
}