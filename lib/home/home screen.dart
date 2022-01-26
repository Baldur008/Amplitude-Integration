import 'package:amplitudedemo/amplitude/amplitude%20calls.dart';
import 'package:amplitudedemo/cart/cart%20screen.dart';
import 'package:amplitudedemo/search/search.dart';

import 'home logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeLogic(context),
      child: _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeLogic>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          AppBarCust(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                InkWell(
                  onTap: () => provider.clickedAd(1, "Banner"),
                  child: Image.asset("assets/bannerad1.jpg"),
                ),
                const BooksWidget(),
                InkWell(
                  onTap: () => provider.clickedAd(2, "Banner"),
                  child: Image.asset("assets/bannerad2.jpg"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BooksWidget extends StatelessWidget {
  const BooksWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeLogic>(context, listen: false);
    return Container(
      color: Colors.blue[50],
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Recommended\nBooks",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => provider.clickedAd(1, "Box Ad"),
                      child: SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/ad3.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text("Best Selling")
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () => provider.clickedAd(2, "Box Ad"),
                child: Container(
                  height: 200,
                  child: Image.asset(
                    "assets/ad1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () => provider.clickedAd(3, "Box Ad"),
                child: Container(
                  height: 200,
                  child: Image.asset(
                    "assets/ad2.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarCust extends StatelessWidget {
  const AppBarCust({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xff84d8e3), Color(0xffa5e6ce)])),
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.menu),
                const SizedBox(width: 10),
                SizedBox(
                  height: 24,
                  child: Image.asset(
                    "assets/logo.png",
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.mic),
                const SizedBox(width: 10),
                InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CartScreen(),
                        )),
                    child: const Icon(Icons.shopping_cart_outlined)),
                const SizedBox(width: 10),
                InkWell(
                    onTap: () async {
                      await AmplitudeCalls.call("Logout", null, context);
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (_) => false);
                    },
                    child: const Icon(Icons.logout)),
              ],
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SearchScreen(),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    const Text(
                      "Search",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 20,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(width: 2, color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.camera_enhance_outlined,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
