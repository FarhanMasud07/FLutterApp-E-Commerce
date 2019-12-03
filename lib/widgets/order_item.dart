import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practiceflutter/providers/orders.dart';

class OrderItms extends StatefulWidget {
  final OrderItem order;
  OrderItms(this.order);

  @override
  _OrderItmsState createState() => _OrderItmsState();
}

class _OrderItmsState extends State<OrderItms> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 4,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order.price.toStringAsFixed(2)}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(widget.order.datetime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.order.products.length * 20.0 + 40, 130),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Card(
                  elevation: 10,
                  
                  child: ListView(
                    children: widget.order.products
                        .map(
                          (prod) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                prod.title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '\$${prod.quantity} x \$${prod.price}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
