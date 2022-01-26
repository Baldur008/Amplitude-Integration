import 'package:amplitudedemo/amplitude/amplitude%20calls.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class _ProductViewLogic with ChangeNotifier {
  _ProductViewLogic(this.context, this.product);
  final BuildContext context;
  final Map<String, String> product;
  bool didInteract = false;
  addToCart() async {
    await AmplitudeCalls.call(
        "Add To Cart", {"Type": product["type"]}, context);
    didInteract = true;
  }

  buynow() async {
    await AmplitudeCalls.call(
        "Instant Buy", {"Type": product["type"]}, context);
    didInteract = true;
  }
}

class _ProductViewScreen extends StatelessWidget {
  const _ProductViewScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<_ProductViewLogic>(context);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, provider.didInteract);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.amber,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Image.asset(
                      provider.product['path'] ?? "assets/prod2.jpg"),
                ),
                Text(
                  provider.product['description'] ?? "",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  r"$" + (provider.product['price'] ?? "200"),
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: provider.addToCart,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Add To cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                InkWell(
                  onTap: provider.buynow,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Buy Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Icon(
                          Icons.delivery_dining,
                          color: Colors.white,
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductViewScreen extends StatelessWidget {
  const ProductViewScreen(this.product, {Key? key}) : super(key: key);
  final Map<String, String> product;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => _ProductViewLogic(context, product),
        child: _ProductViewScreen());
  }
}
