import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'login user data logic.dart';

class LoginUserData extends StatelessWidget {
  const LoginUserData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LoginUserLogic(context), child: _LoginuserData());
  }
}

class _LoginuserData extends StatelessWidget {
  const _LoginuserData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginUserLogic>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Please provide and edit some data for demo purposes",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600]),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustTextWidget("total orders", provider.totalOrders),
                CustTextWidget(
                    "total payments value", provider.totalPaymentValue),
                CustTextWidget("Last Payment Value", provider.lastPaymentValue),
                CustTextWidget(
                    "number of saved payments", provider.totalPaymentMethods),
                CustTextWidget("Total Items in cart", provider.totalCartItems),
                CustTextWidget("Total Returns", provider.totalReturns),
                CustTextWidget("Gender", provider.gender),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recent Order Date",
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Row(
                        children: [
                          Text(provider.dateTime.toIso8601String()),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: provider.dateTime,
                                  firstDate: DateTime(2021, 12, 12),
                                  lastDate: DateTime(2023),
                                );
                              },
                              icon: const Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.orange,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: provider.saveData,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: const Text(
                      "Submit user properties",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(color: Colors.amber),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustTextWidget extends StatelessWidget {
  const CustTextWidget(
    this.title,
    this.controller, {
    this.isNumber = true,
    Key? key,
  }) : super(key: key);
  final String title;
  final TextEditingController controller;
  final bool isNumber;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 20),
        keyboardType: isNumber ? TextInputType.number : null,
        inputFormatters: [
          if (isNumber) FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.orange,
          )),
          focusColor: Colors.orange,
          label: Text(title),
        ),
      ),
    );
  }
}
