import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/Screens/Login/login_screen.dart';
import 'package:classifieds_mobile_app/Screens/Signup/signup_screen.dart';
import 'package:classifieds_mobile_app/Screens/Welcome/components/background.dart';
import 'package:classifieds_mobile_app/components/rounded_button.dart';
import 'package:classifieds_mobile_app/constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            Image.asset('assets/images/welcome.png', ),
            SizedBox(height: size.height * 0.02),
            RoundedButton(
              text: "LOGIN",
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: three,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
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
