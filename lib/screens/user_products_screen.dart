import 'package:flutter/material.dart';
import 'package:practiceflutter/providers/products_provider.dart';
import 'package:practiceflutter/screens/edit_product_screen.dart';
import 'package:practiceflutter/widgets/app_drawer.dart';
import 'package:practiceflutter/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = "/user-product";
  Future<void> _refreshproduct(BuildContext context) async {
    await Provider.of<ProductsProvider>(context).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Widget'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshproduct(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (_, i) => Column(
              children: [
                UserProductItem(
                  productsData.items[i].id,
                  productsData.items[i].imageUrl,
                  productsData.items[i].title,
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
