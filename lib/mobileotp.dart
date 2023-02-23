import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quikshipnew/MyVerify.dart';
import 'package:quikshipnew/homepage.dart';
import 'package:quikshipnew/mobileotp.dart';
import 'package:quikshipnew/pehlapage.dart';

class Mobileotp extends StatefulWidget {
  const Mobileotp({super.key});
  
  static String verifies="";

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

  // void signUserup() async{
  //   showDialog(context: context, builder: (context){
  //     return Center(
  //       child: CircularProgressIndicator(),
  //     );
  //   });
  //   try{
  //   //check if password is confirmed
  //   if(passwordcontroller.text == confirmpasswordcontroller.text){
      
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //     email: emailcontroller.text,
  //     password: passwordcontroller.text,
  //     ).then((value){
  //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Mobileotp()));
  //        }).onError((error, stackTrace) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("Error ${error.toString()}"),
  //     ));
  //   });
  //   } else{
  //     // error message
  //     showErrorMEssage("Password doesnt match");
  //   }
  //     } 
      
  //     on FirebaseAuthException catch (e){
  //       Navigator.pop(context);
  //       showErrorMEssage(e.code);
  //     }
      
  // }
  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(icon: Icon(Icons.arrow_back),
      //   onPressed: (){
      //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Pehlapage()));
      //   },),
      // ),
      resizeToAvoidBottomInset : false,
       body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 230),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
                color: Colors.deepPurpleAccent,
              ),
              child: 
              Column(
                children: [
                  SizedBox(height: 100,),
            //       Padding(
            //         padding: const EdgeInsets.only(top: 30,bottom: 40),
            //         child: Container(
            // alignment: Alignment(0,-0.7),
            //           height: 100,
            //           width: 100,
            //           decoration: BoxDecoration(
            //             shape: BoxShape.circle,
            //             color: Colors.white
            //           ),
            //         ),
            //       ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text('Enter your mobile number',
                      style: TextStyle(fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,bottom: 18),
                      child: Text('to create account',
                      style: TextStyle(fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text('We will send you one time password (OTP)',
                      style: TextStyle(fontSize: 16,
                      color: Colors.white,
                      ),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text('on this Mobile Number',
                      style: TextStyle(fontSize: 16,
                      color: Colors.white,
                      ),),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 260,left: 15,right: 15,bottom: 320),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
      elevation: 10,
      child: Container(
        padding: EdgeInsets.only(top: 30,left: 20,right: 20,),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [

          Container(
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 28, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          onChanged: (value){
                            phone=value;
                          },
                      
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone",
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(height: 10,),
          
          Padding(
            padding: const EdgeInsets.only(bottom: 1),
            child: SizedBox(
              width: double.infinity,
              height: 40,
            
              child: ElevatedButton(
                onPressed: () async{await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber: '${countryController.text + phone}',
  verificationCompleted: (PhoneAuthCredential credential) {},
  verificationFailed: (FirebaseAuthException e) {},
  codeSent: (String verificationId, int? resendToken) {
    Mobileotp.verifies=verificationId;
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MyVerify()));
  },
  codeAutoRetrievalTimeout: (String verificationId) {},
);
                      // Navigator.pushNamed(context, 'verify');
                    },
                 child: Text('SEND OTP',
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
        ]),
      ),
    ),
          )
          
        ],),
    );
  }
}