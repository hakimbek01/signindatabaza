
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:signindatabaza/model/create_user.dart';
import 'package:signindatabaza/model/user_model.dart';

class HiveDB {

  static var box1=Hive.box('baza1');

  ///FOR USER
  static void storeUser(User user) {
    String? strUser=jsonEncode(user);
    box1.put('user', strUser);
  }

  static Map<String?, dynamic> loadUser() {
    String? strUser = box1.get('user');
    Map<String?, dynamic> map = jsonDecode(strUser!);
    return map;
  }

  static void removeUser(){
    box1.delete('user');
  }


  ///FOR CREATE USER
  static void storeCreatUser(CreateUser createUser){
    String? strCreateUser=jsonEncode(createUser);
    box1.put('createUser', strCreateUser);
  }

  static Map<String?, dynamic> loadCreateUser(){
   String? strCreateUser=box1.get('createUser');
   Map<String?, dynamic> map=jsonDecode(strCreateUser!);
   return map;
  }

  static void removeCreateUser(){
    box1.delete('createUser');
  }
}