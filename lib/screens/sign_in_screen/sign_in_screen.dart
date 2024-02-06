import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planner/blocs/authentication/authentication_bloc.dart';
import 'package:planner/blocs/bloc_exports.dart';
import 'package:planner/blocs/sign_in/bloc/sign_in_bloc.dart';
import 'package:planner/screens/sign_in_screen/components/already_have_an_account.dart';
import 'package:planner/screens/sign_in_screen/components/background.dart';
import 'package:planner/screens/sign_in_screen/components/rounded_input_field.dart';
import 'package:planner/screens/sign_in_screen/components/rounded_password_field.dart';
import 'package:planner/screens/sign_up_screen/sign_up_screen.dart';
import 'package:planner/screens/welcome_screen/components/rounded_button.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool signInRequired = false;
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _errorMsg;
  RegExp emailRexExp = RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$');
  RegExp passwordRexExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Provider<SignInBloc>(
      create: (context) => SignInBloc(
          userRepository: context.read<AuthenticationBloc>().userRepository),
      builder: (context, child) {
        return Body(size, context);
      }
    );
  }

  Scaffold Body(Size size, BuildContext context) {
    return Scaffold(
      body: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            setState(() {
              signInRequired = false;
            });
          } else if (state is SignInFailure) {
            setState(() {
              signInRequired = false;
              _errorMsg = 'Invalid email or password';
            });
          }
        },
        child: Background(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "SIGN IN",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
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
                        } else if (!passwordRexExp.hasMatch(val)) {
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
        ),
      ),
    );
  }
}
