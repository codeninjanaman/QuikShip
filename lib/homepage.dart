import 'dart:html';

import 'package:flutter/material.dart';
import 'package:quikship/components/passwordtxfield.dart';
import 'package:quikship/components/textfield.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();

}


class _page1State extends State<page1> {
  bool _isObscure = true;
  bool? check3 = false;
  final Emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset : false,
       body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 230),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.61,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
                color: Colors.deepPurpleAccent,
              ),
              child: 
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30,bottom: 40),
                    child: Container(
            alignment: Alignment(0,-0.7),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text('Sign In to your',
                      style: TextStyle(fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,bottom: 7),
                      child: Text('Account',
                      style: TextStyle(fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text('Sign in to deliver yout package fast',
                      style: TextStyle(fontSize: 20,
                      color: Colors.white,
                      ),),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400,left: 15,right: 15,bottom: 90),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
      elevation: 10,
      child: Container(
        padding: EdgeInsets.only(top: 30,left: 20,right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [

          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: textfield1(
              controller: Emailcontroller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: pswdfield(controller: passwordcontroller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Remember Me',
                style: TextStyle(fontSize: 10),),
                Text('forgot password?',
                style: TextStyle(fontSize:10,
                fontStyle: FontStyle.italic),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: SizedBox(
              width: double.infinity,
              height: 32,
            
              child: ElevatedButton(
                onPressed: (){}, child: Text('Sign In',
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 14),),
              style: ElevatedButton.styleFrom(
                // backgroundColor: Color.fromARGB(a, r, g, b)
                backgroundColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
              ),),
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text('Do not have an account?',
             style: TextStyle(fontSize: 12),),
             Text(' Sign Up',
             style: TextStyle(fontSize: 12,
             color: Colors.deepPurpleAccent,
             decoration: TextDecoration.underline,
            ),)
            
          ],)
        ]),
      ),
    ),
          )
          
        ],),
    );
  }
}