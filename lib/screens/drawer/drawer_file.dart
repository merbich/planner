import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planner/blocs/bloc_exports.dart';
import 'package:planner/blocs/sign_in/bloc/sign_in_bloc.dart';
import 'package:planner/blocs/user/bloc/my_user_bloc.dart';
import 'package:planner/consts/colors_constants.dart';
import 'package:planner/screens/home_screen/home_screen.dart';
import 'package:planner/screens/profile_page/profile_page.dart';
import 'package:planner/screens/welcome_screen/components/rounded_button.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    /*return MultiBlocProvider(
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
        ],
        child:*/ return BlocBuilder<MyUserBloc, MyUserState>(
          builder: (context, state) {
            return Drawer(
              backgroundColor: kPrimaryLightCorol,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      DrawerHeader(
                        child: SvgPicture.asset(
                          "../../assets/icons/login.svg",
                          height: size.height * 0.4,
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.task, color: kPrimaryColor),
                        title: Text("M Y   T A S K S"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        },
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.person, color: kPrimaryColor,),
                        title: Text("P R O F I L E"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfilePage()),
                          );
                        },
                      ),
                    ],
                  ),
                  Center(
                    child: RoundedButton(
                      press: () {
                        context.read<SignInBloc>().add(SignOutRequired());
                      },
                      text: "L O G O U T",
                    ),
                  ),
                ],
              ),
            );
          },
        );//);
  }
}
