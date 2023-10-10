import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quikshipnew/navigationbar/getemail.dart';
import 'package:quikshipnew/navigationbar/getemailfont.dart';
import 'package:quikshipnew/navigationbar/getusername.dart';
import 'package:get/get.dart';
import '../homepage.dart';
import '../storage/signupcontroller.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  Future <void> signUserOut() async{
    await FirebaseAuth.instance.signOut().then((value) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Login()));
    });
  }
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Profile',
        style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF6361EC)

      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 490),
            child: Container(
              height: 170,
              decoration: BoxDecoration(
                color: const Color(0xFF6361EC),
                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(100),bottomRight: Radius.circular(100))
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100,top: 70),
            child: Container(
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.fitHeight
                        ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 250,left: 17,right: 17),
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                
              ),
              child: Row(
                children: [
                  Icon(Icons.person),
                  getusername(documentId: controller.email.text.trim()),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300,left: 17,right: 17),
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                
              ),
              child: Row(
                children: [
                  Icon(Icons.email),
                  getemail2(documentId: controller.email.text.trim()),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 350,left: 17,right: 17),
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white10
                
              ),
              child: Row(
                children: [
                  Icon(Icons.question_answer_rounded),
                  Text('Need help?',
                  style: TextStyle(fontSize: 14),)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 390,left: 17,right: 17),
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white10
                
              ),
              child: Row(
                children: [
                  Icon(Icons.policy_rounded),
                  Text('Privacy & Policy',
                  style: TextStyle(fontSize: 14),)
                ],
              ),
            ),
          ),
          
         Padding(
           padding: const EdgeInsets.only(top: 470,left: 150,right: 17),
           child: ElevatedButton(onPressed: signUserOut, 
           style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF6361EC),
           ),
           child: Text('Logout',
           style: TextStyle(fontSize: 18),)),
         )
        ],
      ),
    );
  }
}