import 'package:classifieds_mobile_app/Pages/Main/components/body.dart';
import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/Pages/Login/components/background.dart';
import 'package:classifieds_mobile_app/Pages/Signup/signup_page.dart';
import 'package:classifieds_mobile_app/components/account_check.dart';
import 'package:classifieds_mobile_app/components/rounded_button.dart';
import 'package:classifieds_mobile_app/components/input_field.dart';
import 'package:classifieds_mobile_app/components/password_field.dart';

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
            Image.asset("assets/images/computer.png", height: 250, width: 250),
            InputField(
              hintText: "Email",
              onChanged: (value) {},
              icon: Icons.mail,
            ),
            PasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Main();
                    },
                  ),
                );
              },
            ),
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
