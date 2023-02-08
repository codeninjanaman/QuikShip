import 'package:flutter/material.dart';
import 'package:quikshipnew/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quikshipnew/pages/ifsignedinornot.dart';
import 'package:quikshipnew/splash.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: AuthPage(),
      home: splash(),
    );
  }
}

