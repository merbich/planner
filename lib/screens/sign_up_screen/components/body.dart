import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:planner/consts/log_in_constants.dart';
import 'package:planner/screens/sign_in_screen/components/text_field_container.dart';
import 'package:planner/screens/sign_in_screen/sign_in_screen.dart';
import 'package:planner/screens/sign_up_screen/components/or_divider.dart';
import 'package:planner/screens/welcome_screen/components/background.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planner/screens/sign_in_screen/components/rounded_input_field.dart';
import 'package:planner/screens/sign_in_screen/components/rounded_password_field.dart';
import 'package:planner/screens/welcome_screen/components/rounded_button.dart';
import 'package:planner/screens/sign_in_screen/components/already_have_an_account.dart';

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
                "SIGN UP",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SvgPicture.asset(
                "../../assets/icons/signup.svg",
                height: size.height * 0.4,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              RoundedButton(text: "SIGN UP", press: () {}),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignInScreen();
                      },
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: kPrimaryLightCorol,
                          ),
                          shape: BoxShape.circle),
                      child: SvgPicture.asset(
                        '../../assets/icons/google-plus.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
