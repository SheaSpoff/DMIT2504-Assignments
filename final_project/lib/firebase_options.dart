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
    apiKey: 'AIzaSyB15t2TkZyexE5yCaF5mfVbsDz2jGBIhDs',
    appId: '1:1043211790358:web:59f5b4da523851e66f6d37',
    messagingSenderId: '1043211790358',
    projectId: 'dmit2504-project',
    authDomain: 'dmit2504-project.firebaseapp.com',
    storageBucket: 'dmit2504-project.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCXWbCWAXM-qxQHih8KwhadsSC8WUEjBg0',
    appId: '1:1043211790358:android:f35a4f8e265a48b86f6d37',
    messagingSenderId: '1043211790358',
    projectId: 'dmit2504-project',
    storageBucket: 'dmit2504-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDT0ZY_oFGMtFKDeuFPDto0nSYQ78TgMI8',
    appId: '1:1043211790358:ios:2ba513b57205fa296f6d37',
    messagingSenderId: '1043211790358',
    projectId: 'dmit2504-project',
    storageBucket: 'dmit2504-project.appspot.com',
    iosBundleId: 'com.example.finalProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDT0ZY_oFGMtFKDeuFPDto0nSYQ78TgMI8',
    appId: '1:1043211790358:ios:2ba513b57205fa296f6d37',
    messagingSenderId: '1043211790358',
    projectId: 'dmit2504-project',
    storageBucket: 'dmit2504-project.appspot.com',
    iosBundleId: 'com.example.finalProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB15t2TkZyexE5yCaF5mfVbsDz2jGBIhDs',
    appId: '1:1043211790358:web:749f0da260194ec66f6d37',
    messagingSenderId: '1043211790358',
    projectId: 'dmit2504-project',
    authDomain: 'dmit2504-project.firebaseapp.com',
    storageBucket: 'dmit2504-project.appspot.com',
  );

}