import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Pehlapage extends StatefulWidget {
  const Pehlapage({super.key});

  @override
  State<Pehlapage> createState() => _PehlapageState();
}

class _PehlapageState extends State<Pehlapage> {
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.deepPurple[200],
        ),
      ),
      
      resizeToAvoidBottomInset : false,
       body:
       Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 230),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
                color: Colors.deepPurpleAccent,
              ),
              child: 
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100,bottom: 40),
                    child: Container(
            alignment: Alignment(0,-0.7),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 340,left: 15,right: 15,bottom: 210),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
      elevation: 10,
      child: Container(
        padding: EdgeInsets.only(top: 30,left: 20,right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SizedBox(
              height: 40,
              child: TextField(
              ),
            )
          ),
        ]),
      ),
    ),
          )
          
        ],),
    );
  }
}