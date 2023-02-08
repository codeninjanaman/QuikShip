import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quikshipnew/pages/ifsignedinornot.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    _navigaatetohome();
  }

  _navigaatetohome() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => AuthPage()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Lottie.network(
          'https://assets7.lottiefiles.com/packages/lf20_6sxyjyjj.json'),
    ));
  }
}