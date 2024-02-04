import 'package:flutter/material.dart';
import 'package:planner/consts/log_in_constants.dart';
import 'package:planner/screens/sign_in_screen/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
    final ValueChanged<String> onChanged;
    final TextEditingController controller;
  const RoundedPasswordField({
    required this.onChanged,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        obscureText: true,
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: "Your password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}