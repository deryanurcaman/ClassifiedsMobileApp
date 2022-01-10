import 'package:classifieds_mobile_app/components/rounded_button_login.dart';
import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/components/text_field.dart';
import 'package:classifieds_mobile_app/palette.dart';

class PasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const PasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  var textPassword = RoundedButtonLoginState.textPassword;
  var validatePassword = RoundedButtonLoginState.validatePassword;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: textPassword,
        obscureText: true,
        onChanged: widget.onChanged,
        cursorColor: two,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: two,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
