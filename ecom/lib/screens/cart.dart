import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  //const Cart({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Container(
        child: Center(
          child: Text('My Cart Screen'),
        ),
      ),
    );
  }
}
