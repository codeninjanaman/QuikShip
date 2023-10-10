import 'package:flutter/material.dart';
import 'package:quikshipnew/navigationbar/sendparcel.dart';

class sendparcelsplash extends StatefulWidget {
  const sendparcelsplash({super.key});

  @override
  State<sendparcelsplash> createState() => _sendparcelsplashState();
}

class _sendparcelsplashState extends State<sendparcelsplash> {
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
            builder: (context) => sendparcel()));
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
            child: Text('Successfully raised your request!',
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






// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:quikshipnew/allparcelsshow.dart';
// import 'package:quikshipnew/pages/ifsignedinornot.dart';

// class publishsplash extends StatefulWidget {
//   const publishsplash({super.key});

//   @override
//   State<publishsplash> createState() => _splashState();
// }

// class _splashState extends State<publishsplash> {
//   @override
//   void initState() {
//     super.initState();
//     _navigaatetohome();
//   }

//   _navigaatetohome() async {
//     await Future.delayed(const Duration(milliseconds: 3000), () {});
//     Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//             builder: (context) => const allparcels()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: Column(
//         children: [
//           Container(
//             height: 300,
//             decoration: BoxDecoration(
//               image: DecorationImage(image: 
//               AssetImage('assets/images/35403216.jpg'))
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 17),
//             child: Text('Successfully published your travel details!',
//             style: TextStyle(fontSize: 25,
//             fontWeight: FontWeight.bold),),
//           )
//         ],
//       )
      
//       // Text('Successfully Published Your Travel',
//       // style: TextStyle(fontSize: 30),),
//     ));
//   }
// }