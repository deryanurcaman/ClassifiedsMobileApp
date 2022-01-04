import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/components/text_field.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:classifieds_mobile_app/components/rounded_button_signup.dart';


class InputField4 extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const InputField4({
     Key ? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<InputField4> createState() => _InputField4State();
}

class _InputField4State extends State<InputField4> {
  var textName4 = RoundedButtonSignupState.textName4;
  var validateName4 = RoundedButtonSignupState.validateName4;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: textName4,
        onChanged: widget.onChanged,
        cursorColor: one,
        decoration: InputDecoration(
          errorText: validateName4 ? 'Value Can\'t Be Empty' : null,
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
