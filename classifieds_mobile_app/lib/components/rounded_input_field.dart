import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/components/text_field_container.dart';
import 'package:classifieds_mobile_app/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: one,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: two,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
