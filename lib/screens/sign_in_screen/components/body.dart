import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planner/blocs/sign_in/bloc/sign_in_bloc.dart';
import 'package:planner/screens/home_screen/home_screen.dart';
import 'package:planner/screens/sign_up_screen/sign_up_screen.dart';
import 'package:planner/screens/welcome_screen/components/background.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planner/screens/sign_in_screen/components/rounded_input_field.dart';
import 'package:planner/screens/sign_in_screen/components/rounded_password_field.dart';
import 'package:planner/screens/welcome_screen/components/rounded_button.dart';
import 'package:planner/screens/sign_in_screen/components/already_have_an_account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatefulWidget {
  const Body({super.key});
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _errorMsg;
  bool signInRequired = false;
  RegExp emailRexExp = RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$');
  RegExp passwordRexExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                  controller: emailTextController,
                  icon: Icons.person,
                  errorMsg: _errorMsg,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please fill in this field!';
                    } else if (!emailRexExp.hasMatch(val)) {
                      return 'Please enter a valid email!';
                    }
                    return null;
                  },
                ),
                RoundedPasswordField(
                  controller: passwordTextController,
                  onChanged: (value) {},
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please fill in this field!';
                    } else if (!emailRexExp.hasMatch(val)) {
                      return 'Please enter a valid password!';
                    }
                    return null;
                  },
                  errorMsg: _errorMsg,
                ),
                !signInRequired
                    ? RoundedButton(
                        text: "LOGIN",
                        press: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<SignInBloc>().add(SignInRequired(
                                emailTextController.text,
                                passwordTextController.text));
                          }
                        },
                      )
                    : const CircularProgressIndicator(),
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
      ),
    );
  }
}
