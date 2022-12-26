import 'dart:async';

import 'package:flutter/material.dart';
import 'package:signindatabaza/pages/home_page.dart';
import 'package:signindatabaza/pages/signin_page.dart';
import 'package:signindatabaza/services/sevices.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? timer;

  @override
  void initState() {
    funk();
    super.initState();
  }

  void funk(){
    timer=Timer.periodic(Duration(seconds: 3), (timer) {
      dataBaza();
      timer.cancel();
    });
  }

  void dataBaza(){
    Map<String?,dynamic> crateUser=HiveDB.loadCreateUser();
    Map<String?,dynamic> user=HiveDB.loadUser();
    print('$crateUser salom');
    if ((crateUser.isEmpty || crateUser==null) && (user.isEmpty || user==null)) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIN(),));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
