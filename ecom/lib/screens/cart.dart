import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/cartDataChange.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = 'cartScreen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            child: Row(
              children: [
                const Text('Total'),
                const Spacer(),
                Chip(
                  label:
                      Text('\u{20B9} ${cart.totalAmount.toStringAsFixed(2)}'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
            itemCount: cart.item.length,
            itemBuilder: (context, index) {
              final cartData = cart.item.values.toList()[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      child: Text('${cartData.price}'),
                    ),
                  ),
                ),
                title: Text(cart.item.values.toList()[index].title),
                subtitle: Text('${cartData.price * cartData.quantity}'),
                trailing: Text('${cartData.quantity}x'),
              );
            },
          ))
        ],
      ),
    );
  }
}
