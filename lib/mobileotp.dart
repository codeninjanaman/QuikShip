import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quikshipnew/MyVerify.dart';

class Mobileotp extends StatefulWidget {
  static String verifies="";

  const Mobileotp({super.key});

  @override
  State<Mobileotp> createState() => _MobileotpState();
}


class _MobileotpState extends State<Mobileotp> {
  final FirebaseAuth auth=FirebaseAuth.instance;

  TextEditingController countryController = TextEditingController();
  var phone="";
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }

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
              height: MediaQuery.of(context).size.height / 2.1,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
                color: Colors.deepPurpleAccent,
              ),
              child: 
              Column(
                children: [
                  SizedBox(height: 100,),
          
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(),
                      child: Text('Enter your mobile number',
                      style: TextStyle(fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text('to create account',
                      style: TextStyle(fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(),
                      child: Text('We will send you one time password (OTP) on this Mobile Number',
                      style: TextStyle(fontSize: 20,
                      color: Colors.white,
                      ),),
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Padding(
                  //     padding: EdgeInsets.only(),
                  //     child: Text('on this Mobile Number',
                  //     style: TextStyle(fontSize: 20,
                  //     color: Colors.white,
                  //     ),),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 260,left: 350,right: 350,bottom: 320),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.only(top: 30,left: 20,right: 20,),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [

          Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 50,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Text(
                      "|",
                      style: TextStyle(fontSize: 28, color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          onChanged: (value){
                            phone=value;
                          },
                      
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone",
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 2)
                      ),
                    ))
                  ],
                ),
              ),
              const SizedBox(height: 10,),
          
          Padding(
            padding: const EdgeInsets.only(bottom: 1),
            child: SizedBox(
              width: double.infinity,
              height: 50,
            
              child: ElevatedButton(
                onPressed: () async{
                  showDialog(context: context, builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
                  await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber: countryController.text + phone,
  verificationCompleted: (PhoneAuthCredential credential) {},
  verificationFailed: (FirebaseAuthException e) {},
  codeSent: (String verificationId, int? resendToken) {
    Mobileotp.verifies=verificationId;
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const MyVerify()));
  },
  codeAutoRetrievalTimeout: (String verificationId) {},
);
                      // Navigator.pushNamed(context, 'verify');
                    },
              style: ElevatedButton.styleFrom(
                // backgroundColor: Color.fromARGB(a, r, g, b)
                backgroundColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
              ),
                 child: const Text('SEND OTP',
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 14),),),
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