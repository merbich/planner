import 'package:flutter/material.dart';
import 'package:planner/app_view.dart';
import 'package:planner/blocs/authentication/authentication_bloc.dart';
import 'package:planner/blocs/bloc_exports.dart';
import 'package:planner/packages/user_repository/lib/user_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp(this.userRepository, {super.key});

  final UserRepository userRepository;

  // This widget is the root of your application.
   @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
			providers: [
				RepositoryProvider<AuthenticationBloc>(
					create: (_) => AuthenticationBloc(
						myUserRepository: userRepository
					)
				)
			], 
			child: const MyAppView()
		);
  }
}
