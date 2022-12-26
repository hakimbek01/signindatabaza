class CreateUser {
  String? name;
  String? email;
  String? phone;
  String? password;
  CreateUser({this.password,this.phone,this.email,this.name});


  Map<String, dynamic> toJson()=> {
    'name':name,
    'email':email,
    'phone':phone,
    'password':password
  };
}