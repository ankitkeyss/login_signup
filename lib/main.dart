
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/border_radius.dart';
import 'login.dart';
import 'register.dart';

void main() {
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: 'login',
      routes: {
      'login':(context)=>MyLoginPage(),
        'register':(context)=>MyRegisterPage(),
  },
     // home:  MyLoginPage(),
    );
  }
}

