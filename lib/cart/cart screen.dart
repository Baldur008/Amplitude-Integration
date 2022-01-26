import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart screen logic.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CartScreenLogic(context), child: _CartScreen());
  }
}

class _CartScreen extends StatelessWidget {
  const _CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CartScreenLogic>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        actions: [
          IconButton(onPressed: provider.clearAll, icon: Icon(Icons.clear_all)),
        ],
      ),
      body: ListView(
        children: provider.copyList
            .map<Widget>(
              (e) => Container(
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
                      child: Text(
                        e['description'] ?? "Invalid descriptons",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Text(
                          r"$" + (e["price"] ?? r"$200"),
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                          ),
                        ),
                        InkWell(
                            onTap: () => provider.delete(e),
                            child: Icon(Icons.delete, color: Colors.red)),
                        ElevatedButton(onPressed: ()=>provider.buy(e), child: Text("Buy"))
                      ],
                    ),
                  ],
                ),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.black54,
                ))),
              ),
            )
            .toList(),
      ),
    );
  }
}
