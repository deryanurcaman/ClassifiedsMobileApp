import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/components/text_field.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:classifieds_mobile_app/components/rounded_button_signup.dart';

class InputField3 extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const InputField3({
     Key ? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<InputField3> createState() => _InputField3State();
}

class _InputField3State extends State<InputField3> {
  var textName3 = RoundedButtonSignupState.textName3;
  var validateName3 = RoundedButtonSignupState.validateName3;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: textName3,
        onChanged: widget.onChanged,
        cursorColor: one,
        decoration: InputDecoration(
          errorText: validateName3 ? 'Value Can\'t Be Empty' : null,
          icon: Icon(
            widget.icon,
            color: two,
          ),
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
