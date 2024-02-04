import 'package:flutter/material.dart';
import 'package:planner/screens/sign_up_screen/components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return const Scaffold(
      body: Body(),
    );
  }
}