import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:planner/screens/bottom_bar.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:planner/screens/welcome_screen/components/body.dart';

import '../screens/home_screen/home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

 @override
 Widget build(BuildContext context) {
   return StreamBuilder<User?>(
     stream: FirebaseAuth.instance.authStateChanges(),
     builder: (context, snapshot) {
       if (!snapshot.hasData) {
         return SignInScreen(
           providers: [
              EmailAuthProvider(),
              GoogleProvider(clientId : "458254148123-qffmfmten1jo8j41d1a0fdffboibicb4.apps.googleusercontent.com"),
           ],
           /*headerBuilder: (context, constraints, shrinkOffset) {
             return Padding(
               padding: const EdgeInsets.all(20),
               child: AspectRatio(
                 aspectRatio: 1,
                 child: Image.asset('../../assets/cat.png'),
               ),
             );
           },
           subtitleBuilder: (context, action) {
             return Padding(
               padding: const EdgeInsets.symmetric(vertical: 8.0),
               child: action == AuthAction.signIn
                   ? const Text('Welcome to FlutterFire, please sign in!')
                   : const Text('Welcome to Flutterfire, please sign up!'),
             );
           },
           footerBuilder: (context, action) {
            return const Padding(
              padding: EdgeInsets.only(top : 16),
              child: Text(
                'By signing in, you agree to our terms and conditions.',
                style: TextStyle(color: Colors.grey),
              ),
              );
           },
           sideBuilder: (context, shrinkOffset){
            return Padding(
              padding: const EdgeInsets.all(20),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset('../../assets/cat.png'),
              ),
            );
           },*/
         );
       }

       return const BottomBarScreen();
     },
   );
 }
}