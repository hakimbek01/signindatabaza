import 'package:flutter/material.dart';

import '../services/sevices.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController=PageController();
  int index=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade500,
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: (){
                  HiveDB.removeUser();
                },
                child: Text('Remove User'),
              ),
              ElevatedButton(
                onPressed: (){
                  HiveDB.removeCreateUser();
                },
                child: Text('Remove CreateUser'),
              )
            ],
          )
        )
      ),
    );
  }
}
