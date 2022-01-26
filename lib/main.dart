import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitudedemo/home/home%20screen.dart';
import 'package:amplitudedemo/login/login%20scree.dart';
import 'package:amplitudedemo/login/login%20user%20data.dart';
import 'package:amplitudedemo/products/products%20screen.dart';
import 'package:amplitudedemo/search/search.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Amplitude.getInstance().init("f3be9cdd3152daff310c0844b1620480");
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          child: child ?? const SizedBox(),
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        );
      },
      initialRoute: "/",
      onGenerateRoute: (RouteSettings settings) {
        var page = settings.name == "/"
            ? LoginScreen()
            : settings.name == "/home"
                ? HomeScreen()
                : settings.name == "/loginUserData"
                    ? LoginUserData()
                    : SearchScreen();
        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}
