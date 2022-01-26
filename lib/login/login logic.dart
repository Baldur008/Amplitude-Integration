import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitudedemo/amplitude/amplitude%20calls.dart';
import 'package:flutter/material.dart';

class LoginLogic with ChangeNotifier {
  bool showsignIn = true,
      showsignUp = false,
      showError = false,
      loading = false,
      calledCreateAccountClicked = false,
      calledStartsTypingData = false;
  final TextEditingController controller = TextEditingController(),
      gender = TextEditingController();

  final BuildContext context;
  LoginLogic(this.context) {
    AmplitudeCalls.call("Login Screen", null, context);
    controller.addListener(() {
      if (showsignUp && !calledStartsTypingData) {
        AmplitudeCalls.call("Starts Typing Data", null, context);
        calledStartsTypingData = !calledStartsTypingData;
      }
    });
  }

  continueButton() async {
    if (controller.text.isEmpty) return;
    Amplitude.getInstance().setUserId( controller.text);
    print("Came here");
    if (showsignIn) {
    print("Came here too");
      Navigator.pushReplacementNamed(context, "/loginUserData");
      return;
    }

    print("But Came here too");

    if (gender.text.isEmpty) {
      gender.text = "undefined";
    }

    await Amplitude.getInstance().setUserProperties({
      "Total Orders": 0,
      "Total Payment Methods": 0,
      "Total Cart Items": 0,
      "Gender": gender.text[0].toLowerCase() == 'u'
          ? "Undefined"
          : gender.text[0].toLowerCase() == "m"
              ? "Male"
              : "Female",
      "Last Order Date": null,
      r"$Last Payment Value": 0,
      r"$Total Payment Value": 0,
      "Total Returns": 0,
    });
    await AmplitudeCalls.call(
      "Account Created",
      {
        "Type": controller.text.contains('@') ? "Email" : "Phone",
      },
      context,
    );
    Navigator.pushReplacementNamed(context, "/home");
  }

  loadingFun(bool value) {
    loading = value;
    notifyListeners();
  }

  showSignInToggle() {
    showsignIn = true;
    showsignUp = false;
    notifyListeners();
  }

  showSignUpToggle() async {
    showsignIn = false;
    showsignUp = true;
    notifyListeners();
    if (calledCreateAccountClicked) return;
    await AmplitudeCalls.call("Create Account Clicked", null, context);
    calledCreateAccountClicked = true;
  }
}
