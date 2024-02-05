import 'package:flutter/material.dart';
import 'package:planner/consts/colors_constants.dart';
import 'package:planner/screens/sign_in_screen/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? errorMsg;
  const RoundedInputField({
    required this.hintText,
    required this.icon,
    this.onChanged,
    required this.controller,
    this.validator,
    this.errorMsg,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validator,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
          fillColor: kPrimaryLightCorol,
          errorText: errorMsg,
        ),
      ),
    );
  }
}