import 'package:flutter/material.dart';
import 'package:planner/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner/screens/home_screen/home_screen.dart';
import 'package:planner/screens/welcome_screen/welcome_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
			debugShowCheckedModeBanner: false,
			title: 'Planner',
			home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
				builder: (context, state) {
					if(state.status == AuthenticationStatus.authenticated) {
						return const HomeScreen();
					} else {
						return const WelcomeScreen();
					}
				}
			),
		);
  }
}