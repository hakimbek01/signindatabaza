
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:signindatabaza/model/user_model.dart';

class HiveDB {

  static var box1=Hive.box('baza1');

  static void storeUser(User user) {
    String? strUser=jsonEncode(user);
    box1.put('user', strUser);
  }

  static User loadUser()  {
    String strUser=box1.get('user');
    Map<String ,dynamic> map =jsonDecode(strUser);
    return User.fromJson(map);
  }

  static void removeUser(){
    box1.delete('user');
  }

}