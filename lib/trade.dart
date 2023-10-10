import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class landingpage extends StatelessWidget {
  const landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Lottie.network(
          'https://lottie.host/b9bda037-a500-4924-91b5-27b538e89d0c/3q6IyJwkMu.json'
        ) ,
      ),
    );
  }
}