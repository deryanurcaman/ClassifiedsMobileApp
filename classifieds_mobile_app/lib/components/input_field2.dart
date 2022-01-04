import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/components/text_field.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:classifieds_mobile_app/components/rounded_button_signup.dart';

class InputField2 extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const InputField2({
     Key ? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<InputField2> createState() => _InputField2State();
}

class _InputField2State extends State<InputField2> {
  var textName2 = RoundedButtonSignupState.textName2;
  var validateName2 = RoundedButtonSignupState.validateName2;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: textName2,
        onChanged: widget.onChanged,
        cursorColor: one,
        decoration: InputDecoration(
          errorText: validateName2 ? 'Value Can\'t Be Empty' : null,
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
