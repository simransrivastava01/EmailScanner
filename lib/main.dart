//import 'package:flutter/material.dart';
//import 'HomePage.dart';
//
//void main()
//{
//  runApp(new HomePage());
//}
//
//class HomePage extends StatelessWidget
//{
//  @override
//  Widget build(BuildContext context)
//  {
//    return new MaterialApp
//      (
//      title: "Blog App",
//      theme: new ThemeData(
//        primarySwatch: Colors.pink,
//        scaffoldBackgroundColor: Color(0xff0a0c23),
//      ),
//      home:HomePage(),
//    );
//
//  }
//}


import 'package:flutter/material.dart';
import 'HomePage.dart';

void main()
{
  runApp(new MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new MaterialApp
      (
      title: "Blog App",
      theme: new ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Color(0xff0a0c23),
      ),
      //home:HomePage(),
      initialRoute: HomePage.id,
      routes: {
        HomePage.id:(context) => HomePage(),
      },
    );
  }
}