import 'package:flutter/material.dart';
import 'package:planner/consts/colors_constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.65,
      decoration: BoxDecoration(
        color: kPrimaryLightCorol,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}