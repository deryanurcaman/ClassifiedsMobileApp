import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/Pages/Login/login_page.dart';
import 'package:classifieds_mobile_app/Pages/Signup/components/background.dart';
import 'package:classifieds_mobile_app/components/account_check.dart';
import 'package:classifieds_mobile_app/components/rounded_button.dart';
import 'package:classifieds_mobile_app/components/input_field.dart';
import 'package:classifieds_mobile_app/components/password_field.dart';

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
            InputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            PasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGN UP",
              textColor: Colors.black,
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
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
