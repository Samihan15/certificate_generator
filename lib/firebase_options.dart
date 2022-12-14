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
    apiKey: 'AIzaSyC6iFftQgcLOgeUy5OVU6rBLnBp4HTIJFE',
    appId: '1:1003242588147:web:9b6770205cba239470b486',
    messagingSenderId: '1003242588147',
    projectId: 'candidate-basic-data',
    authDomain: 'candidate-basic-data.firebaseapp.com',
    databaseURL: 'https://candidate-basic-data-default-rtdb.firebaseio.com',
    storageBucket: 'candidate-basic-data.appspot.com',
    measurementId: 'G-MTVL8ZVNQS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6-d4GkdwDfcsfIrgfnY6ZEMntH_oNnzc',
    appId: '1:1003242588147:android:c7c46ebbef3818c870b486',
    messagingSenderId: '1003242588147',
    projectId: 'candidate-basic-data',
    databaseURL: 'https://candidate-basic-data-default-rtdb.firebaseio.com',
    storageBucket: 'candidate-basic-data.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCmbP1TidOrCXHU352v3gDmc81OWkp-Jdg',
    appId: '1:1003242588147:ios:a36c98a3a11db75f70b486',
    messagingSenderId: '1003242588147',
    projectId: 'candidate-basic-data',
    databaseURL: 'https://candidate-basic-data-default-rtdb.firebaseio.com',
    storageBucket: 'candidate-basic-data.appspot.com',
    iosClientId: '1003242588147-3b5gta5mv7n02o4m7olj5q88nvdponv3.apps.googleusercontent.com',
    iosBundleId: 'com.example.certificateGenerator',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCmbP1TidOrCXHU352v3gDmc81OWkp-Jdg',
    appId: '1:1003242588147:ios:a36c98a3a11db75f70b486',
    messagingSenderId: '1003242588147',
    projectId: 'candidate-basic-data',
    databaseURL: 'https://candidate-basic-data-default-rtdb.firebaseio.com',
    storageBucket: 'candidate-basic-data.appspot.com',
    iosClientId: '1003242588147-3b5gta5mv7n02o4m7olj5q88nvdponv3.apps.googleusercontent.com',
    iosBundleId: 'com.example.certificateGenerator',
  );
}
