import 'package:classifieds_mobile_app/Pages/Home/home_page.dart';
import 'package:classifieds_mobile_app/Pages/Products/products_view.dart';
import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/Pages/Login/components/background.dart';
import 'package:classifieds_mobile_app/Pages/Signup/signup_page.dart';
import 'package:classifieds_mobile_app/components/account_check.dart';
import 'package:classifieds_mobile_app/components/rounded_button_login.dart';
import 'package:classifieds_mobile_app/components/input_field.dart';
import 'package:classifieds_mobile_app/components/password_field.dart';

import '../../../authentication.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isLogin = true;
  String _message = "";
  late String _userId;
  late String _email;
  late String _password;

  late Authentication auth;

  var textName = RoundedButtonLoginState.textName;
  var validateName = RoundedButtonLoginState.validateName;
  var textPassword = RoundedButtonLoginState.textPassword;
  var validatePassword = RoundedButtonLoginState.validatePassword;

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
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: size.height * 0.01),
            Image.asset("assets/images/computer.png", height: 250, width: 250),
            InputField(
              hintText: "Email",
              onChanged: (value) {},
              icon: Icons.mail,
            ),
            PasswordField(
              onChanged: (value) {},
            ),
            RoundedButtonLogin(
              text: "LOGIN",
              textColor: Colors.black,
              press: () async {
                try {
                  _userId = await auth.login(textName.text, textPassword.text);

                  if (_userId != null) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Home()));
                  }
                } catch (errorMessage) {
                  setState(() {
                    _message = errorMessage.toString();
                  });
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            Text(_message),
            SizedBox(height: size.height * 0.03),
            AccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUp();
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
