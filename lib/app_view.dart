import 'package:flutter/material.dart';
import 'package:planner/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner/blocs/bloc/get_task/bloc/get_task_bloc.dart';
import 'package:planner/blocs/sign_in/bloc/sign_in_bloc.dart';
import 'package:planner/blocs/user/bloc/my_user_bloc.dart';
import 'package:planner/screens/drawer/drawer_file.dart';
import 'package:planner/screens/home_screen/home_screen.dart';
import 'package:planner/screens/welcome_screen/welcome_screen.dart';
import 'package:planner/task_repository/lib/src/firebase_task_repository.dart';
import 'package:provider/provider.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planner',
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          return MultiBlocProvider(
            providers: [
              Provider<SignInBloc>(
                create: (context) => SignInBloc(
                    userRepository:
                        context.read<AuthenticationBloc>().userRepository),
              ),
              Provider<MyUserBloc>(
                create: (context) => MyUserBloc(
                    myUserRepository:
                        context.read<AuthenticationBloc>().userRepository)
                  ..add(GetMyUser(
                      myUserId:
                          context.read<AuthenticationBloc>().state.user!.uid)),
              ),
              Provider<GetTaskBloc>(
                  create: (context) =>
                      GetTaskBloc(postRepository: FirebasePostRepository())
                        ..add(GetTasks())),
            ],
            child: const HomeScreen(),
          );
        } else {
          return const WelcomeScreen();
        }
      }),
    );
  }
}
