import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitudedemo/amplitude/amplitude%20calls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginUserLogic with ChangeNotifier {
  LoginUserLogic(this.context);

  final BuildContext context;
  final TextEditingController controller = TextEditingController(),
      totalOrders = TextEditingController(text: "12"),
      totalPaymentMethods = TextEditingController(text: "2"),
      totalCartItems = TextEditingController(text: "5"),
      gender = TextEditingController(text: "male"),
      lastPaymentValue = TextEditingController(text: "2500"),
      totalPaymentValue = TextEditingController(text: "10000"),
      totalReturns = TextEditingController(text: "3");
  DateTime dateTime = DateTime.now();

  saveData() async {
    await Amplitude.getInstance().setUserProperties({
      "Total Orders": totalOrders.text,
      "Total Payment Methods": totalPaymentMethods.text,
      "Total Cart Items": totalCartItems.text,
      "Gender": gender.text[0].toLowerCase() == 'u'
          ? "Undefined"
          : gender.text[0].toLowerCase() == "m"
              ? "Male"
              : "Female",
      "Last Order Date": dateTime.toIso8601String(),
      r"$Last Payment Value": lastPaymentValue.text,
      r"$Total Payment Value": totalPaymentValue.text,
      "Total Returns": totalReturns.text,
    });
    await AmplitudeCalls.call("Login Success", null, context);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Event uploaded custom user properties")));
    Navigator.pushReplacementNamed(context, "/home");
  }
}
