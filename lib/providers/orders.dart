import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:practiceflutter/providers/cart.dart';
import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final double price;
  final List<CartItem> products;
  final DateTime datetime;

  OrderItem({
    @required this.id,
    @required this.price,
    @required this.datetime,
    @required this.products,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    const url = 'https://fluttertest-7ec69.firebaseio.com/orders.json';
    http.post(
      url,
      body: json.encode({
        'price': total,
        'dateTime': DateTime.now().toIso8601String(),
      }),
    );
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        price: total,
        datetime: DateTime.now(),
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
