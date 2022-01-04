import 'package:classifieds_mobile_app/components/rounded_button_signup.dart';
import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/components/text_field.dart';
import 'package:classifieds_mobile_app/palette.dart';

class PasswordField2 extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const PasswordField2({
    Key ? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<PasswordField2> createState() => _PasswordField2State();
}

class _PasswordField2State extends State<PasswordField2> {
 var textPassword2 = RoundedButtonSignupState.textPassword2;
  var validatePassword2 = RoundedButtonSignupState.validatePassword2;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: textPassword2,
        obscureText: true,
        onChanged: widget.onChanged,
        cursorColor: two,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: two,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: two,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
