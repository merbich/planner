// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:planner/consts/colors_constants.dart';
import 'package:planner/screens/sign_in_screen/components/text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {

    final ValueChanged<String>? onChanged;
    final TextEditingController controller;
    final String? Function(String?)? validator;
    final String? errorMsg;

  const RoundedPasswordField({
    super.key,
    this.onChanged,
    required this.controller,
    this.validator,
    this.errorMsg,
  });

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        obscureText: true,
        onChanged: widget.onChanged,
        decoration: const InputDecoration(
          hintText: "Your password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
