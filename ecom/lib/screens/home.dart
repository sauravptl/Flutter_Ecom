import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);
  static const routeName = 'productdetail';

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final productData = Provider.of<Products>(context).findById(productId);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.asset(
            productData.imageUrl
          ),
          const SizedBox(
            height: 10,
          ),
          Text('\u{20B9} ${productData.price.toString()}'),
          const SizedBox(
            height: 10,
          ),
          Text(productData.title),
          Text(productData.description),
        ],
      ),
    );
  }
}
