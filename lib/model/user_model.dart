class User {
  String? email;
  String? password;
  User({this.password,this.email});

  Map<String,dynamic> toJson()=>{
    'email':email,
    'password':password
  };
}