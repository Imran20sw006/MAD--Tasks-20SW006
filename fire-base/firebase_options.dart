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
    apiKey: 'AIzaSyAoYDau27S_ptfprKGHxdIYlVGCPLSiyCw',
    appId: '1:669900466371:web:07fe41921a5c36c5661a76',
    messagingSenderId: '669900466371',
    projectId: 'imran-b9644',
    authDomain: 'imran-b9644.firebaseapp.com',
    storageBucket: 'imran-b9644.appspot.com',
    measurementId: 'G-268QD3MNRD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWyeilDBTYvGSW2JP4F2YoGxUhw1kTVJI',
    appId: '1:669900466371:android:ca8ff8d55b736d15661a76',
    messagingSenderId: '669900466371',
    projectId: 'imran-b9644',
    storageBucket: 'imran-b9644.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBfHOL3CWn49Z_hewkvtqTeZ1F5FEClRmU',
    appId: '1:669900466371:ios:95681e18278dac58661a76',
    messagingSenderId: '669900466371',
    projectId: 'imran-b9644',
    storageBucket: 'imran-b9644.appspot.com',
    iosBundleId: 'com.example.fire',
  );
}
