import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/components/text_field.dart';
import 'package:classifieds_mobile_app/palette.dart';
import 'package:classifieds_mobile_app/components/rounded_button_login.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const InputField({
    Key ? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  var textName = RoundedButtonLoginState.textName;
  var validateName = RoundedButtonLoginState.validateName;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: textName,
        onChanged: widget.onChanged,
        cursorColor: one,
        decoration: InputDecoration(
          errorText: validateName ? 'Value Can\'t Be Empty' : null,
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
