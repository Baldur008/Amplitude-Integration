import 'package:amplitudedemo/products/product%20view%20screen.dart';
import 'package:amplitudedemo/products/products%20Screen%20logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({this.searched = "Products", Key? key}) : super(key: key);
  final String searched;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ProductsLogic(context), child: _ProductsScreen(searched: searched,));
  }
}

class _ProductsScreen extends StatelessWidget {
  const _ProductsScreen({
    Key? key,
    this.searched = "Products",
  }) : super(key: key);
  final String searched;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductsLogic>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(searched),
      ),
      body: ListView(
        children: ProductsLogic.products
            .map<Widget>(
              (e) => InkWell(
                onTap: () => Navigator.push<bool>(context,
                    MaterialPageRoute<bool>(builder: (_) => ProductViewScreen(e))).then<bool>((value)=>provider.participation(value)),
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset(e['path'] ?? "assets/prod2.jpg"),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e['description'] ?? "Invalid descriptons",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              r"$" + (e["price"] ?? r"$200"),
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.black54,
                  ))),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
