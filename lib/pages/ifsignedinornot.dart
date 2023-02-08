import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:quikshipnew/homepage.dart';
import 'package:quikshipnew/pages/openingpage.dart';
import 'package:quikshipnew/pehlapage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if(snapshot.hasData){
            return const Pehlapage();
          }
          //user not logged in 
          else{
            return const Login();
          }
        },
      ),
    );
  }
}