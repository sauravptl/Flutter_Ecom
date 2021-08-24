import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/cartDataChange.dart';
import '/models/product.dart';
import '/models/authentication.dart';

import '/screens/signup.dart';
import '/screens/productDetails.dart';
import '/screens/cart.dart';
import '/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AuthenticationData(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Logic Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => const SignUpScreen(),
          ProductScreen.routeName: (ctx) => const ProductScreen(),
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
        },
      ),
    );
  }
}