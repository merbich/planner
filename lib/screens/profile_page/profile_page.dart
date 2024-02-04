import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planner/consts/colors_constants.dart';
import 'package:planner/screens/drawer/drawer_file.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: kPrimaryLightCorol,
      appBar: AppBar(
        title: Text("P R O F I L E  P A G E", textAlign: TextAlign.center,),
        backgroundColor: kSecondaryColor,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          // profile pic
          const Icon(
            Icons.person,
            size: 70,
          ),
          const SizedBox(
            height: 10,
          ),
          //email
          Text(currentUser.email!,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700])),
          const SizedBox(
            height: 10,
          ),

        ],
      ),
    );
  }
}
