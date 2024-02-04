import 'package:flutter/material.dart';
import 'package:planner/consts/colors_constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function()? press;
  final Color color, textColor;
  const RoundedButton({
    super.key,
    this.color = kPrimaryColor,
    required this.text,
    required this.press,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: Container(
              color: color,
              height: size.height*0.07,
              child: TextButton(
                onPressed: press,
                child: Text(
                  text,
                  style: TextStyle(color: textColor, fontSize: 15),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
