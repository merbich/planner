import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planner/blocs/authentication/authentication_bloc.dart';
import 'package:planner/blocs/sign_in/bloc/sign_in_bloc.dart';
import 'package:planner/blocs/sign_up/bloc/sign_up_bloc.dart';
import 'package:planner/consts/colors_constants.dart';
import 'package:planner/screens/sign_in_screen/components/already_have_an_account.dart';
import 'package:planner/screens/sign_in_screen/components/rounded_input_field.dart';
import 'package:planner/screens/sign_in_screen/components/rounded_password_field.dart';
import 'package:planner/screens/sign_in_screen/sign_in_screen.dart';
import 'package:planner/screens/sign_up_screen/components/background.dart';
import 'package:planner/screens/sign_up_screen/components/or_divider.dart';
import 'package:planner/screens/welcome_screen/components/rounded_button.dart';
import 'package:planner/user_repository/lib/user_repository.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final nameController = TextEditingController();
  bool signUpRequired = false;
  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsNumber = false;
  bool containsSpecialChar = false;
  bool contains8Length = false;

  RegExp emailRexExp = RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$');
  RegExp passwordRexExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$');
  RegExp specialCharRexExp =
      RegExp(r'^(?=.*?[!@#$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^])');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Provider<SignUpBloc>(
      create: (context) => SignUpBloc(
          userRepository: context.read<AuthenticationBloc>().userRepository),
      builder: (context, child) {
        return Body(size, context);
      }
    );
  }

  Scaffold Body(Size size, BuildContext context) {
    return Scaffold(
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            setState(() {
              signUpRequired = false;
            });
            Navigator.pop(context);
          } else if (state is SignUpProcess) {
            setState(() {
              signUpRequired = true;
            });
          } else if (state is SignInFailure) {
            return;
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
                      "SIGN UP",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    SvgPicture.asset(
                      "../../assets/icons/signup.svg",
                      height: size.height * 0.3,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    RoundedInputField(
                      controller: emailTextController,
                      hintText: "Your Email",
                      onChanged: (value) {},
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please fill in this field';
                        } else if (!emailRexExp.hasMatch(val)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      icon: Icons.email,
                    ),
                    RoundedPasswordField(
                      controller: passwordTextController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please fill in this field';
                        } else if (!passwordRexExp.hasMatch(val)) {
                          return 'Please enter a valid password';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        if (val!.contains(RegExp(r'[A-Z]'))) {
                          setState(() {
                            containsUpperCase = true;
                          });
                        } else {
                          setState(() {
                            containsUpperCase = false;
                          });
                        }
                        if (val.contains(RegExp(r'[a-z]'))) {
                          setState(() {
                            containsLowerCase = true;
                          });
                        } else {
                          setState(() {
                            containsLowerCase = false;
                          });
                        }
                        if (val.contains(RegExp(r'[0-9]'))) {
                          setState(() {
                            containsNumber = true;
                          });
                        } else {
                          setState(() {
                            containsNumber = false;
                          });
                        }
                        if (val.contains(specialCharRexExp)) {
                          setState(() {
                            containsSpecialChar = true;
                          });
                        } else {
                          setState(() {
                            containsSpecialChar = false;
                          });
                        }
                        if (val.length >= 8) {
                          setState(() {
                            contains8Length = true;
                          });
                        } else {
                          setState(() {
                            contains8Length = false;
                          });
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "⚈  1 uppercase",
                              style: TextStyle(
                                  color: containsUpperCase
                                      ? Colors.green
                                      : Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                            ),
                            Text(
                              "⚈  1 lowercase",
                              style: TextStyle(
                                  color: containsLowerCase
                                      ? Colors.green
                                      : Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                            ),
                            Text(
                              "⚈  1 number",
                              style: TextStyle(
                                  color: containsNumber
                                      ? Colors.green
                                      : Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "⚈  1 special character",
                              style: TextStyle(
                                  color: containsSpecialChar
                                      ? Colors.green
                                      : Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                            ),
                            Text(
                              "⚈  8 minimum character",
                              style: TextStyle(
                                  color: contains8Length
                                      ? Colors.green
                                      : Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                            ),
                          ],
                        ),
                      ],
                    ),
                    RoundedInputField(
                      hintText: 'Name',
                      icon: Icons.abc,
                      controller: nameController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please fill in this field';
                        } else if (val.length > 30) {
                          return 'Name too long';
                        }
                        return null;
                      },
                    ),
                    !signUpRequired
                        ? RoundedButton(
                            text: "SIGN UP",
                            press: () {
                              if (_formKey.currentState!.validate()) {
                                MyUser myUser = MyUser.empty;
                                myUser = myUser.copyWith(
                                  email: emailTextController.text,
                                  name: nameController.text,
                                );

                                setState(() {
                                  context.read<SignUpBloc>().add(
                                      SignUpRequired(myUser,
                                          passwordTextController.text));
                                });
                              }
                            },
                          )
                        : const CircularProgressIndicator(),
                    AlreadyHaveAnAccountCheck(
                      login: false,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const SignInPage();
                            },
                          ),
                        );
                      },
                    ),
                    const OrDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 10),
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
          ),
        ),
      ),
    );
  }
}
