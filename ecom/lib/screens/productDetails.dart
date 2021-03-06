import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/cartDataChange.dart';
import '/models/product.dart';

import '/screens/cart.dart';
import '/screens/home.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);
  static const routeName = 'product_screen';

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final productData = Provider.of<Products>(context);
    final valid = ModalRoute.of(context)!.settings.arguments as bool;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(CartScreen.routeName),
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[100],
                border: Border.all(
                  color: Colors.blueGrey,
                  width: 2,
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
              ),
              child: GridTile(
                child: GestureDetector(
                  child: Center(
                    child: Text(
                      'Product Image',
                      style: TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.bold),
                    ),
                    //child: Image.asset(productData.imageUrl,fit: BoxFit.cover,),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        ProductDetailScreen.routeName,
                        arguments: productData.items[index].id);
                  },
                ),
                footer: GridTileBar(
                  backgroundColor: Colors.blueGrey,
                  title: Text(
                    productData.items[index].title,
                    textAlign: TextAlign.center,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      if (valid) {
                        cart.addItem(
                            productData.items[index].id,
                            productData.items[index].price,
                            productData.items[index].title);
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Added to cart, Check cart'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Please Login First'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/', (route) => false);
                                },
                                child: const Text('OK'),
                              )
                            ],
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.shopping_cart),
                  ),
                ),
              ),
            ),
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: productData.items.length,
        ),
      ),
    );
  }
}
