import 'package:amplitudedemo/login/login%20logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginLogic(context),
      child: const _LoginScreen(),
    );
  }
}

class _LoginScreen extends StatelessWidget {
  const _LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginLogic>(context);
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Stack(
          children: [
            SafeArea(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      height: 42,
                      color: Colors.grey[300],
                      width: double.infinity,
                      child: Image.asset("assets/logo.png")),
                  Divider(
                    thickness: 1,
                    color: Colors.grey[400],
                    height: 0,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Welcome",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        signup(),
                        SingIn(),
                      ],
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: ()=>Navigator.pushReplacementNamed(context, '/home'),
                      child: Text(
                        "Skip and use past user properties",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18.0,
                    ),
                    child: Divider(
                      thickness: 2,
                      height: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultTextStyle(
                    style: TextStyle(color: Colors.blue),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text("Conditons of use"),
                        Text("Privacy Notice"),
                        Text("Help"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "2022, Amazon 1:1 Demo Realogic Works",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )),
            if (provider.loading)
              Center(
                child: CircularProgressIndicator(),
              )
          ],
        ));
  }
}

class signup extends StatelessWidget {
  const signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginLogic>(context);
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(width: 0.2),
          color: provider.showsignUp ? Colors.grey[100] : null,
        ),
        child: Column(
          children: [
            InkWell(
              onTap: provider.showSignUpToggle,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    provider.showsignUp
                        ? Icons.radio_button_on
                        : Icons.radio_button_off,
                    color: provider.showsignUp ? Colors.orange : Colors.black,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    " Create account. ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    "New to Amazon?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            if (provider.showsignUp)
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Custtextfield(
                        title: "Name",
                      ),
                      Custtextfield(
                        title: "Mobile Number",
                      ),
                      Custtextfield(
                        title: "Email (optional)",
                      ),
                      Custtextfield(
                        title: "Set password",
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.check_box_outlined,
                            color: Colors.orange,
                            size: 20,
                          ),
                          SizedBox(width: 5),
                          Text("Show password")
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "By enrolling your mobile phone number, you will not consent to recieving automated security notifications via text message from demo Amazon. You can ot out by removing your mobile number on the Login & Security page which is not build in this demo application in Your Account Settings.",
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: provider.continueButton,
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 0.2)),
                        ),
                      ),
                      const SizedBox(height: 15),
                     
                      RichText(
                          text: TextSpan(
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                              children: [
                            TextSpan(
                                text:
                                    "By creating, this demo doesn't require you agree to Amazon's "),
                            TextSpan(
                              text: " Condition's of Use ",
                              style: TextStyle(color: Colors.blue),
                            ),
                            TextSpan(text: "and"),
                            TextSpan(
                              text: " Privacy Notice.",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ]))
                    ],
                  ),
                ],
              ),
          ],
        ));
  }
}

class Custtextfield extends StatelessWidget {
  const Custtextfield({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginLogic>(context, listen: false);
    return Column(
      children: [
        TextField(
          controller: provider.controller,
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange)),
              contentPadding: EdgeInsets.only(left: 10),
              hintText: title),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class SingIn extends StatelessWidget {
  const SingIn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginLogic>(context);
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(width: 0.2),
          color: provider.showsignIn ? Colors.grey[100] : null,
        ),
        child: Column(
          children: [
            InkWell(
              onTap: provider.showSignInToggle,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    provider.showsignIn
                        ? Icons.radio_button_on
                        : Icons.radio_button_off,
                    color: provider.showsignIn ? Colors.orange : Colors.black,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    " Sign-in. ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const Text(
                    "Already a customer?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            if (provider.showsignIn)
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      TextField(
                        controller: provider.controller,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange)),
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: "Email or phone number"),
                      ),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: () async {
                          provider.loadingFun(true);
                          await provider.continueButton();
                        },
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 0.2)),
                        ),
                      ),
                      const SizedBox(height: 15),
                      RichText(
                          text: TextSpan(
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                              children: [
                            TextSpan(
                                text:
                                    "By continuing, this demo doesn't require you agree to Amazon's "),
                            TextSpan(
                              text: " Condition's of Use ",
                              style: TextStyle(color: Colors.blue),
                            ),
                            TextSpan(text: "and"),
                            TextSpan(
                              text: " Privacy Notice.",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ]))
                    ],
                  ),
                ],
              ),
          ],
        ));
  }
}
