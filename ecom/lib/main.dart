import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/cart.dart';
import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/catalog': (context) => Home(),
        '/cart': (context) => Cart(),
      },
      //home: MyHomePage(title: 'E-commerce App'),
    );
  }
}
