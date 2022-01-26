import 'package:flutter/material.dart';

class OrderConfirmationPage extends StatelessWidget {
  const OrderConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
        ),
        body: Center(
            child: Text(
          "Order Confirmed\n The product will be delivered within 5-6 business days",
          style: TextStyle(
              color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )));
  }
}
