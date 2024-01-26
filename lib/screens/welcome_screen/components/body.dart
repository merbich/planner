import 'package:flutter/material.dart';
import 'package:planner/screens/welcome_screen/components/background.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planner/screens/welcome_screen/components/rounded_button.dart';
import 'package:planner/consts/log_in_constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "WELCOME",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: size.height * 0.03,),
              SvgPicture.asset(
                "../../assets/icons/chat.svg",
                height: size.height * 0.4,
              ),
              SizedBox(height: size.height * 0.03,),
              RoundedButton(
                text: "SIGN IN",
                color: kPrimaryColor,
                textColor: Colors.black,
                press: () {},
              ),
              RoundedButton(
                text: "SIGN UP",
                textColor: Colors.black,
                color: kPrimaryLightCorol,
                press: () {},
              ),
            ]),
      ),
    );
  }
}

