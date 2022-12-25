import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:signindatabaza/pages/home_page.dart';
import 'package:signindatabaza/pages/signin_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('baza1');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignIN(),
    );
  }
}
