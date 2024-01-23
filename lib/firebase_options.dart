// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBHWWG4euB750ffCc2_JpBgzyhgmwiimqY',
    appId: '1:458254148123:web:f2d5ed4fbcf395d8624ebe',
    messagingSenderId: '458254148123',
    projectId: 'planner-45629',
    authDomain: 'planner-45629.firebaseapp.com',
    storageBucket: 'planner-45629.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKjv-j1FrvFfb3aGEDLTmY6V7R71LN33g',
    appId: '1:458254148123:android:d25059c9aed099df624ebe',
    messagingSenderId: '458254148123',
    projectId: 'planner-45629',
    storageBucket: 'planner-45629.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPtnV2R8J6TIA4RplzUh3dpiieaeNuVLY',
    appId: '1:458254148123:ios:2add5f9eff3325ff624ebe',
    messagingSenderId: '458254148123',
    projectId: 'planner-45629',
    storageBucket: 'planner-45629.appspot.com',
    iosBundleId: 'com.example.planner',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCPtnV2R8J6TIA4RplzUh3dpiieaeNuVLY',
    appId: '1:458254148123:ios:bb36de3ad2eddc28624ebe',
    messagingSenderId: '458254148123',
    projectId: 'planner-45629',
    storageBucket: 'planner-45629.appspot.com',
    iosBundleId: 'com.example.planner.RunnerTests',
  );
}