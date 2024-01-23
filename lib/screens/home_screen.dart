import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
//import 'package:planner/services/dark_theme_prefs.dart';
import 'package:provider/provider.dart';
import 'package:planner/provider/dark_theme_provider.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context)
  {
    final themeState = Provider.of<DarkThemeProvider>(context);
    
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset('../../assets/happy_cat.jpg'),
            Text('WelCum!',
            style: Theme.of(context).textTheme.displaySmall,
            ),
            SwitchListTile(
            title: const Text('Theme'),
            secondary: Icon(themeState.getDarkTheme ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            value: themeState.getDarkTheme, 
            onChanged: (bool value) {
              setState(() {
                themeState.setDarkTheme = value;
              });
            },
            ),
            const SignOutButton(),
          ],
        ),
        )
    );
  }
}   