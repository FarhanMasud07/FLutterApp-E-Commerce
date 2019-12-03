import 'package:flutter/material.dart';
import 'package:practiceflutter/providers/cart.dart';
import 'package:practiceflutter/providers/orders.dart';
import 'package:practiceflutter/screens/cart_screen.dart';
import 'package:practiceflutter/screens/orders_screen.dart';
import 'package:practiceflutter/screens/product_detail_screen.dart';
import 'package:practiceflutter/screens/product_overview_screen.dart';
import './providers/products_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routName: (ctx) => OrdersScreen(),
        },
      ),
    );
  }
}
