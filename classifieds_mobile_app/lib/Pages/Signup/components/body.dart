import 'package:classifieds_mobile_app/Pages/Home/home_page.dart';
import 'package:classifieds_mobile_app/components/input_field2.dart';
import 'package:classifieds_mobile_app/components/input_field3.dart';
import 'package:classifieds_mobile_app/components/input_field4.dart';
import 'package:classifieds_mobile_app/components/password_field2.dart';
import 'package:classifieds_mobile_app/components/rounded_button_signup.dart';
import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/Pages/Login/login_page.dart';
import 'package:classifieds_mobile_app/Pages/Signup/components/background.dart';
import 'package:classifieds_mobile_app/components/account_check.dart';

import '../../../authentication.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String _userId;
  String _message = "";
  late Authentication auth;

  var textName2 = RoundedButtonSignupState.textName2;
  var validateName2 = RoundedButtonSignupState.validateName2;
  var textName3 = RoundedButtonSignupState.textName3;
  var validateName3 = RoundedButtonSignupState.validateName3;
  var textName4 = RoundedButtonSignupState.textName4;
  var validateName4 = RoundedButtonSignupState.validateName4;
  var textPassword2 = RoundedButtonSignupState.textPassword2;
  var validatePassword2 = RoundedButtonSignupState.validatePassword2;

  @override
  void initState() {
    auth = Authentication();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Text(
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: size.height * 0.01),
            Image.asset("assets/images/spaceship.png", height: 200, width: 200),
            SizedBox(height: size.height * 0.03),
            InputField2(
              hintText: "Name",
              onChanged: (value) {},
              icon: Icons.person,
            ),
            InputField3(
              hintText: "Surname",
              onChanged: (value) {},
              icon: Icons.person,
            ),
            InputField4(
              hintText: "Email",
              onChanged: (value) {},
              icon: Icons.mail,
            ),
            PasswordField2(
              onChanged: (value) {},
            ),
            RoundedButtonSignup(
              text: "SIGN UP",
              textColor: Colors.black,
              press: () async {
                setState(() {
                  textName2.text.isEmpty
                      ? validateName2 = true
                      : validateName2 = false;
                  textName3.text.isEmpty
                      ? validateName3 = true
                      : validateName3 = false;
                  textName4.text.isEmpty
                      ? validateName4 = true
                      : validateName4 = false;
                  textPassword2.text.isEmpty
                      ? validatePassword2 = true
                      : validatePassword2 = false;
                });

                if (validateName2 == false &&
                    validateName3 == false &&
                    validateName4 == false &&
                    validatePassword2 == false) {
                  try {
                    _userId = await auth.signUp(
                        textName4.text,
                        textPassword2.text,
                        textName2.text + ' ' + textName3.text);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Home();
                        },
                      ),
                    );
                  } catch (errorMessage) {
                    _message = errorMessage.toString();
                  }
                }
              },
            ),
            SizedBox(height: size.height * 0.02),
            AccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Login();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
