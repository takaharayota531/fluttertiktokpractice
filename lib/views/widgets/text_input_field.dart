import 'package:flutter/material.dart';
import 'package:tiktokpractice/constants.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.icon,
    this.isObscure = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        labelStyle: const TextStyle(
          fontSize: 20,
        ),
        // 入力欄の境界線を作る
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: BORDER_COLOR,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: BORDER_COLOR,
            )),
      ),
      // TextFieldの中身を見れなくする
      obscureText: isObscure,
    );
  }
}
