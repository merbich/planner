//import 'dart:html';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:planner/app.dart';
import 'package:planner/firebase_options.dart';
import 'package:planner/login/auth_gate.dart';
import 'package:planner/packages/user_repository/lib/src/firebase_user_repository.dart';
import 'package:planner/simple_bloc_observer.dart';
import 'package:planner/packages/user_repository/lib/user_repository.dart';

import 'blocs/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // HydratedBloc.storage = await HydratedStorage.build(
    //storageDirectory: kIsWeb 
    //? HydratedStorage.webStorageDirectory
    //: await getTemporaryDirectory(),
  //);
  runApp(MyApp(FirebaseUserRepository() as UserRepository));
}

