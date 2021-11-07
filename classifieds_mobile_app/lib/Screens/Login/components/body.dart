import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/Screens/Login/components/background.dart';
import 'package:classifieds_mobile_app/Screens/Signup/signup_screen.dart';
import 'package:classifieds_mobile_app/components/already_have_an_account_acheck.dart';
import 'package:classifieds_mobile_app/components/rounded_button.dart';
import 'package:classifieds_mobile_app/components/rounded_input_field.dart';
import 'package:classifieds_mobile_app/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

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
            Image.asset(
              "assets/images/computer.png", 
              height: 300,
              width: 300
            ),
            SizedBox(height: size.height * 0.01),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              textColor: Colors.black,
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
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
