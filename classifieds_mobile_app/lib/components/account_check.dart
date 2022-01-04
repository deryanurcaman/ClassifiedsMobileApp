import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/palette.dart';

class AccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login
              ? "Don't you have an account? Then "
              : "Already have an account? Then ",
          style: TextStyle(color: five),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Login",
            style: TextStyle(
              color: five,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
