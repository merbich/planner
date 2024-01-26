import 'package:flutter/material.dart';
import 'package:planner/consts/log_in_constants.dart';
import 'package:planner/screens/sign_in_screen/components/text_field_container.dart';
import 'package:planner/screens/sign_up_screen/sign_up_screen.dart';
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
                "SIGN IN",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SvgPicture.asset(
                "../../assets/icons/login.svg",
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
              RoundedButton(text: "LOGIN", press: () {}),
              SizedBox(
                height: size.height * 0.03,
              ),
              AlreadyHaveAnAccountCheck(
                login: true,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              )
            ]),
      ),
    );
  }
}
