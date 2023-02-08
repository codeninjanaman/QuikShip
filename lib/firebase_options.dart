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
    apiKey: 'AIzaSyA638b1BFFL62yahU7bc6fIKiApBsuvhhE',
    appId: '1:582274920280:web:8fea01228c7615f6f8bf2d',
    messagingSenderId: '582274920280',
    projectId: 'quikshipnew',
    authDomain: 'quikshipnew.firebaseapp.com',
    storageBucket: 'quikshipnew.appspot.com',
    measurementId: 'G-X049FHNF05',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD1GuhZalHlVpZCnjoeHppTA8JjI97gRh4',
    appId: '1:582274920280:android:7c7d0b82649c1736f8bf2d',
    messagingSenderId: '582274920280',
    projectId: 'quikshipnew',
    storageBucket: 'quikshipnew.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6voQQuoirwfMcj0fWhOJk2l74Fng1cgo',
    appId: '1:582274920280:ios:81eded5d84126217f8bf2d',
    messagingSenderId: '582274920280',
    projectId: 'quikshipnew',
    storageBucket: 'quikshipnew.appspot.com',
    androidClientId: '582274920280-2gilkad11bpqu678jk6ko018gkhsabv9.apps.googleusercontent.com',
    iosClientId: '582274920280-94gkg7tl68q4ro780hjh1l3o26nl9e92.apps.googleusercontent.com',
    iosBundleId: 'com.example.quikshipnew',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6voQQuoirwfMcj0fWhOJk2l74Fng1cgo',
    appId: '1:582274920280:ios:81eded5d84126217f8bf2d',
    messagingSenderId: '582274920280',
    projectId: 'quikshipnew',
    storageBucket: 'quikshipnew.appspot.com',
    androidClientId: '582274920280-2gilkad11bpqu678jk6ko018gkhsabv9.apps.googleusercontent.com',
    iosClientId: '582274920280-94gkg7tl68q4ro780hjh1l3o26nl9e92.apps.googleusercontent.com',
    iosBundleId: 'com.example.quikshipnew',
  );
}