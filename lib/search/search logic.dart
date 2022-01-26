import 'package:amplitudedemo/amplitude/amplitude%20calls.dart';
import 'package:amplitudedemo/products/products%20screen.dart';
import 'package:flutter/material.dart';

class Search_Logic with ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  static const List<String> searches = [
    "Electronics",
    "Books",
    "Furniture",
    "Hardware",
    "Movies",
    "Softwares",
    "Iphone",
    "Android",
    "Car accessories",
    "Pendrives",
    "TrackPads",
    "Laptops",
    "DIYs",
    "Hard Disks"
  ];
  final BuildContext context;
  Search_Logic(this.context) {
    controller.addListener(() {
      notifyListeners();
    });
    AmplitudeCalls.call("Search Clicked", null, context);
  }
  search() async {
    await AmplitudeCalls.call("Search Initiated", null, context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => ProductScreen(searched: controller.text,)));
  }
}
