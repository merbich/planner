//import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:planner/consts/theme_data.dart';
import 'package:planner/firebase_options.dart';
import 'package:planner/login/auth_gate.dart';
import 'package:planner/provider/dark_theme_provider.dart';
import 'package:planner/screens/bottom_bar.dart';
import 'package:planner/screens/home_screen.dart';
//import 'package:planner/services/dark_theme_prefs.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)
        {
          return themeChangeProvider;
        })
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: const AuthGate(),
          );
        }
      ),
    );
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme = await themeChangeProvider.darkThemePrefs.getTheme();
  }
}

