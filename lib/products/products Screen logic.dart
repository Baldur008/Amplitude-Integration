import 'package:amplitudedemo/amplitude/amplitude%20calls.dart';
import 'package:flutter/cupertino.dart';

class ProductsLogic with ChangeNotifier {
  ProductsLogic(this.context);
  final BuildContext context;

  onTap(Map<String, String> e) async {
    await AmplitudeCalls.call(
        "Product Clicked",
        {
          "Type": e["type"],
        },
        context);
  }

  participation(bool? value)  async {
    await AmplitudeCalls.call("Participation", {"properties": value??false}, context);
  }

  static const List<Map<String, String>> products = [
    {
      "path": "assets/prod2.jpg",
      "type": "Electronics",
      "price": "200",
      "description":
          r"Best true wireless earbuds available at 200$ price range and contains Noice cancellation"
    },
    {
      "path": "assets/prod3.jpg",
      "type": "Electronics",
      "price": "500",
      "description":
          "Best watch for smart utilities which can track steps, locationa and inform you about your calls and notifications"
    },
    {
      "path": "assets/prod1.jpeg",
      "type": "Others",
      "price": "60",
      "description":
          "Best combo products available on this website with cheap price"
    },
    {
      "path": "assets/prod5.jpg",
      "type": "Books",
      "price": "20",
      "description": r"Best book which is below 20$ price from this application"
    },
    {
      "path": "assets/prod4.jpg",
      "type": "Others",
      "price": "10",
      "description":
          "Best dog chewing calcuium bones available in online stores"
    },
    {
      "path": "assets/prod7.jpg",
      "type": "Others",
      "price": "150",
      "description":
          "Best powder to clean clothes with 10 pack and heavy discount available"
    },
    {
      "path": "assets/prod8.jpg",
      "type": "Electronics",
      "price": "300",
      "description":
          "Best Meta verse gadget avaibale for vr games, videos and conference types"
    }
  ];
}
