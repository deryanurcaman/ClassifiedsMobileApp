import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/components/text_field_container.dart';
import 'package:classifieds_mobile_app/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
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
