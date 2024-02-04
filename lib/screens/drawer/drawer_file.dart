import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planner/consts/colors_constants.dart';
import 'package:planner/screens/home_screen/home_screen.dart';
import 'package:planner/screens/profile_page/profile_page.dart';
import 'package:planner/screens/sign_in_screen/sign_in_screen.dart';
import 'package:planner/screens/welcome_screen/components/rounded_button.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  void signOut()
  {
    FirebaseAuth.instance.signOut();
    FirebaseUIAuth.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInPage()));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                leading: Icon(Icons.task),
                title: Text("M Y   T A S K S"),
                trailing: Text('0'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("P R O F I L E"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfilePage()),
                  );
                },
              ),
            ],
          ),
          Center(
            child: RoundedButton(
              press: signOut,
              text: "L O G O U T",),
          ),
        ],
      ),
    );
  }
}
