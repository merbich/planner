import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:flutter/material.dart';
import 'package:planner/screens/sign_in_screen/sign_in_screen.dart';

import '../screens/home_screen/home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: StreamBuilder(
       stream: FirebaseAuth.instance.authStateChanges(),
       builder: (context, snapshot) {
         if (!snapshot.hasData) {
           return const SignInPage();
         }
     
         else {
           return const HomeScreen();
         }
       },
     ),
   );
 }
}

//GoogleProvider(clientId : "458254148123-qffmfmten1jo8j41d1a0fdffboibicb4.apps.googleusercontent.com"),