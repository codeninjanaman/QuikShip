import 'package:flutter/material.dart';
import 'package:quikshipnew/allparcelsshow.dart';

class acceptparcelsplash extends StatefulWidget {
  const acceptparcelsplash({super.key});

  @override
  State<acceptparcelsplash> createState() => _acceptparcelsplashState();
}

class _acceptparcelsplashState extends State<acceptparcelsplash> {
  @override
  void initState() {
    super.initState();
    _navigaatetohome();
  }

  _navigaatetohome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const allparcels()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(image: 
              AssetImage('assets/images/35403216.jpg'))
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Text('You have accepted the parcel',
            style: TextStyle(fontSize: 25,
            fontWeight: FontWeight.bold),),
          )
        ],
      )
      
      // Text('Successfully Published Your Travel',
      // style: TextStyle(fontSize: 30),),
    ));
  }
}