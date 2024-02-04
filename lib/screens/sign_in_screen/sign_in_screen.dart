import 'package:flutter/material.dart';
import 'package:planner/screens/sign_in_screen/components/body.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(),
    );
  }
}