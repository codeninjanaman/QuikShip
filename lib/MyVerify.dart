import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:quikshipnew/MyVerify.dart';
import 'package:quikshipnew/homepage.dart';
import 'package:quikshipnew/mobileotp.dart';
import 'package:quikshipnew/pehlapage.dart';

class MyVerify extends StatefulWidget {
  const MyVerify({super.key});
  
  static String verifies="";

  @override
  State<MyVerify> createState() => _MyVerifyState();
}


class _MyVerifyState extends State<MyVerify> {
  final FirebaseAuth auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    var code="";
    
    return Scaffold(

      resizeToAvoidBottomInset : false,
       body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 230),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
                color: Colors.deepPurpleAccent,
              ),
              child: 
              Column(
                children: [
                  SizedBox(height: 100,),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,bottom: 15),
                      child: Text('OTP Verification',
                      style: TextStyle(fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text('Please enter the otp sent to you',
                      style: TextStyle(fontSize: 16,
                      color: Colors.white,
                      ),),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 210,left: 15,right: 15,bottom: 300),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
      elevation: 10,
      child: Container(
        padding: EdgeInsets.only(top: 30,left: 20,right: 20,),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Pinput(
                onChanged: (value){
                  code=value;
                },
                length: 6,
                // defaultPinTheme: defaultPinTheme,
                // focusedPinTheme: focusedPinTheme,
                // submittedPinTheme: submittedPinTheme,

                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
          
          Padding(
            padding: const EdgeInsets.only(bottom: 1,top: 15),
            child: SizedBox(
              width: double.infinity,
              height: 40,
            
              child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async{
                      try{
PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: Mobileotp.verifies, smsCode: code);

    // Sign the user in (or link) with the credential
    await auth.signInWithCredential(credential);
    // ignore: use_build_context_synchronously
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Pehlapage()));
                      }
                      catch(e){
                        print('Wrong OTP');

                      }
                     
                    },
                    child: Text("Verify Phone Number")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Mobileotp()));
                      },
                      child: Text(
                        "Edit Phone Number ?",
                        style: TextStyle(color: Colors.grey.shade800,
                        fontSize: 10),
                      )),
                
              ],
            ),
          ),

        ]),
      ),
    ),
          )
          
        ],),
    );
  }
}