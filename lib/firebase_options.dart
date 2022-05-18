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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDE3Xsd-y60oJ29FjsHEKV59EBOwFwffQ4',
    appId: '1:292973057917:web:98f410b7f91b00645e5e14',
    messagingSenderId: '292973057917',
    projectId: 'flutterqueueapp',
    authDomain: 'flutterqueueapp.firebaseapp.com',
    storageBucket: 'flutterqueueapp.appspot.com',
    measurementId: 'G-SRSV49QTFJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDPjJTN5ypzJA8REuRmYN50ABgQUrL_oRA',
    appId: '1:292973057917:android:3eb6dac2440b29225e5e14',
    messagingSenderId: '292973057917',
    projectId: 'flutterqueueapp',
    storageBucket: 'flutterqueueapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7bgoBV4pUVHyMDyIwIhZGdBrImI6TBZQ',
    appId: '1:292973057917:ios:0196ec85dcc5944c5e5e14',
    messagingSenderId: '292973057917',
    projectId: 'flutterqueueapp',
    storageBucket: 'flutterqueueapp.appspot.com',
    iosClientId: '292973057917-lhlpqujlbcjf31efv22d7h2fskip0557.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFirebaseCleanArchitecture',
  );
}
