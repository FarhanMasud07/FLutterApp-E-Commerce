// import 'package:flutter/material.dart';
// import 'package:practiceflutter/providers/orders.dart';
// import 'package:practiceflutter/widgets/app_drawer.dart';
// import 'package:practiceflutter/widgets/order_item.dart';
// import 'package:provider/provider.dart';

// class OrdersScreen extends StatefulWidget {
//   static const routName = '/orders';

//   @override
//   _OrdersScreenState createState() => _OrdersScreenState();
// }

// class _OrdersScreenState extends State<OrdersScreen> {
//   var _isInit = true;
//   var _isloading = false;
//   @override
//   void didChangeDependencies() {
//     if (_isInit) {
//       setState(() {
//         _isloading = true;
//       });
//       Provider.of<Orders>(context, listen: false).fetchAndSetOrders().then((_) {
//         setState(() {
//           _isloading = false;
//         });
//       });
//     }
//     _isInit = false;
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ordersData = Provider.of<Orders>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Orders'),
//       ),
//       drawer: AppDrawer(),
//       body: _isloading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView.builder(
//               itemCount: ordersData.orders.length,
//               itemBuilder: (ctx, i) => OrderItms(
//                 ordersData.orders[i],
//               ),
//             ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:practiceflutter/providers/orders.dart';
import 'package:practiceflutter/widgets/app_drawer.dart';
import 'package:practiceflutter/widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routName = '/orders';

  @override
  Widget build(BuildContext context) {
    print('building orders');
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              // ...
              // Do error handling stuff
              return Center(
                child: Text('An error occurred!'),
              );
            } else {
              return Consumer<Orders>(
                builder: (ctx, orderData, child) => ListView.builder(
                  itemCount: orderData.orders.length,
                  itemBuilder: (ctx, i) => OrderItms(orderData.orders[i]),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
