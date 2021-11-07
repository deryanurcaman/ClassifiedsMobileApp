import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/Screens/Login/login_screen.dart';
import 'package:classifieds_mobile_app/Screens/Signup/components/background.dart';
import 'package:classifieds_mobile_app/components/already_have_an_account_acheck.dart';
import 'package:classifieds_mobile_app/components/rounded_button.dart';
import 'package:classifieds_mobile_app/components/rounded_input_field.dart';
import 'package:classifieds_mobile_app/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: size.height * 0.03),
             Image.asset(
              "assets/images/spaceship.png", 
              height: 250,
              width: 250
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGN UP",
              textColor: Colors.black,
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
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
          
          ],
        ),
      ),
    );
  }
}
