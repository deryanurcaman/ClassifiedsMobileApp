import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/components/text_field.dart';
import 'package:classifieds_mobile_app/palette.dart';

class PasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const PasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
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
