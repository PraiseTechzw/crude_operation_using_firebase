// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCE0LIWC4y9Mr_Ys34XZArwClcrnzZ7GCs',
    appId: '1:90710267776:web:d5522dc2263e24240e9365',
    messagingSenderId: '90710267776',
    projectId: 'simple-todo-app-c8723',
    authDomain: 'simple-todo-app-c8723.firebaseapp.com',
    storageBucket: 'simple-todo-app-c8723.firebasestorage.app',
    measurementId: 'G-3CCLYY5DFN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBOkqCzWE9-m_HrkVG-CdJpkkduSmDu7fY',
    appId: '1:90710267776:android:976f5b2a89051aa70e9365',
    messagingSenderId: '90710267776',
    projectId: 'simple-todo-app-c8723',
    storageBucket: 'simple-todo-app-c8723.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBYl1W7bohzJzzTslHYcZCIu0nolvq0iec',
    appId: '1:90710267776:ios:16862625250d06390e9365',
    messagingSenderId: '90710267776',
    projectId: 'simple-todo-app-c8723',
    storageBucket: 'simple-todo-app-c8723.firebasestorage.app',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBYl1W7bohzJzzTslHYcZCIu0nolvq0iec',
    appId: '1:90710267776:ios:16862625250d06390e9365',
    messagingSenderId: '90710267776',
    projectId: 'simple-todo-app-c8723',
    storageBucket: 'simple-todo-app-c8723.firebasestorage.app',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCE0LIWC4y9Mr_Ys34XZArwClcrnzZ7GCs',
    appId: '1:90710267776:web:ccfce7ded92f2f3f0e9365',
    messagingSenderId: '90710267776',
    projectId: 'simple-todo-app-c8723',
    authDomain: 'simple-todo-app-c8723.firebaseapp.com',
    storageBucket: 'simple-todo-app-c8723.firebasestorage.app',
    measurementId: 'G-L3DSGJ32P9',
  );
}
