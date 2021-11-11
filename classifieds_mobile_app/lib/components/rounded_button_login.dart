import 'package:flutter/material.dart';
import 'package:classifieds_mobile_app/palette.dart';

class RoundedButtonLogin extends StatefulWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  const RoundedButtonLogin({
    Key ? key,
    required this.text,
    required this.press,
    this.color = two,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  State<RoundedButtonLogin> createState() => RoundedButtonLoginState();
}

class RoundedButtonLoginState extends State<RoundedButtonLogin> {
  static TextEditingController textName = TextEditingController();
  static TextEditingController textName2 = TextEditingController();
  static TextEditingController textName3 = TextEditingController();
  static TextEditingController textName4 = TextEditingController();
  static bool validateName = false;
  static bool validateName2 = false;
  static bool validateName3 = false;
  static bool validateName4 = false;
  static TextEditingController textPassword = TextEditingController();
  static TextEditingController textPassword2 = TextEditingController();
  static bool validatePassword = false;
  static bool validatePassword2 = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: newElevatedButton(),
      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        widget.text,
        style: TextStyle(color: widget.textColor),
      ),
      onPressed: widget.press,
      style: ElevatedButton.styleFrom(
          primary: widget.color,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          textStyle: TextStyle(
              color: widget.textColor, fontSize: 14, fontWeight: FontWeight.w500)),
    );
  }
}
