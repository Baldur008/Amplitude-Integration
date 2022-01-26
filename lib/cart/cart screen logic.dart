import 'package:amplitudedemo/amplitude/amplitude%20calls.dart';
import 'package:amplitudedemo/cart/Order%20Confirmation%20Page.dart';
import 'package:amplitudedemo/products/products%20Screen%20logic.dart';
import 'package:flutter/material.dart';

class CartScreenLogic with ChangeNotifier {
  final BuildContext context;
  List copyList = ProductsLogic.products.sublist(0);

  CartScreenLogic(this.context) {
    AmplitudeCalls.call("View Cart", null, context);
  }

  buy(Map<String, String> value) async {
    await AmplitudeCalls.call("Buy", null, context);
    copyList.remove(value);
    notifyListeners();
    await Navigator.push(context, MaterialPageRoute(builder: (_)=>OrderConfirmationPage()));
    await AmplitudeCalls.call("Order Confirmation", null, context);
  }

  clearAll() {
    AmplitudeCalls.call("Clear Cart", {"Item count": copyList.length}, context);
    copyList = [];
    notifyListeners();
  }

  delete(Map<String, String> value) async {
    copyList.remove(value);
    notifyListeners();
    await AmplitudeCalls.call("Delete Item", {"type": value["type"]}, context);
  }
}
