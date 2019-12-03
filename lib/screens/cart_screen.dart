import 'package:flutter/material.dart';
import 'package:practiceflutter/providers/orders.dart';
import 'package:practiceflutter/widgets/cart_item.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cart';
  @override
  Widget build(BuildContext context) {
    //final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Consumer<Cart>(
                    builder: (_, cartItem, child) => Chip(
                      label: Text(
                        '\$${cartItem.totalAmmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Theme.of(context).primaryTextTheme.title.color,
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  Spacer(),
                  Consumer<Cart>(
                    builder: (_, cartItem, child) => FlatButton(
                      child: Text('Order Now'),
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false).addOrder(
                          cartItem.items.values.toList(),
                          cartItem.totalAmmount,
                        );
                        cartItem.clearCart();
                      },
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Consumer<Cart>(
            builder: (_, cartItem, child) => Expanded(
              child: ListView.builder(
                itemCount: cartItem.items.length,
                itemBuilder: (ctx, i) => CartItemAll(
                  cartItem.items.values.toList()[i].id,
                  cartItem.items.keys.toList()[i],
                  cartItem.items.values.toList()[i].price,
                  cartItem.items.values.toList()[i].quantity,
                  cartItem.items.values.toList()[i].title,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
