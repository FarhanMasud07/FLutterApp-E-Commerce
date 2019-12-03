import 'package:flutter/material.dart';
import 'package:practiceflutter/providers/orders.dart';
import 'package:practiceflutter/widgets/app_drawer.dart';
import 'package:practiceflutter/widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routName = '/orders';
  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: ordersData.orders.length,
        itemBuilder: (ctx, i) => OrderItms(
          ordersData.orders[i],
        ),
      ),
    );
  }
}
