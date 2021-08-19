import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  //const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => Navigator.pushNamed(context, '/cart'),
        ),
      ]),
      body: Container(
          child: Column(
        children: [],
      )),
    );
  }
}
