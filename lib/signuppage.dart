import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quikshipnew/homepage.dart';
import 'package:quikshipnew/mobileotp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quikshipnew/storage/signupcontroller.dart';
import 'package:uuid/uuid.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});


  // final String fullName;
  // final String email;

  // const Signup(this.fullName, this.email, {super.key});
  
  @override
  State<Signup> createState() => _SignupState();
}


class _SignupState extends State<Signup> {
  final emailcontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  late String fullName;
  late String email;
  bool _isObscure = true;


  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  Future addUser(){
    return users 
    .add({
      'username': fullName,
      'email':email,
    }).then((value) => print("User Added"))
    .catchError((error) => print("Failed to add user : $error"));
  }

  void showErrorMEssage(String message){
    showDialog(context: context, builder: (context){
      return
      AlertDialog(
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(child: Text(message,
        style: const TextStyle(color: Colors.white),)),
      );
    });
  }

  

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    var ID = controller.uuid.v1();
    // var uuid = Uuid();
    // String ID = uuid.v1();
    return Scaffold(
      resizeToAvoidBottomInset : false,
       body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 230),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150),bottomRight: Radius.circular(150)),
                color: Colors.deepPurpleAccent,
              ),
              child: 
              Column(
                children: [
            //       Padding(
            //         padding: const EdgeInsets.only(top: 30,bottom: 40),
            //         child: Container(
            // alignment: const Alignment(0,-0.7),
            //           height: 100,
            //           width: 100,
            //           decoration: const BoxDecoration(
            //             shape: BoxShape.circle,
            //             color: Colors.white
            //           ),
            //         ),
            //       ),
                  const Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 150),
                      child: Text('Sign Up',
                      style: TextStyle(fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),),
                    ),
                  ),
                  // const Align(
                  //   alignment: Alignment.topLeft,
                  //   child: Padding(
                  //     padding: EdgeInsets.only(left: 15,bottom: 7),
                  //     child: Text('with Travellers',
                  //     style: TextStyle(fontSize: 40,
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.bold),),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250,left: 320,right: 320,bottom: 90),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [

          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SizedBox(
              height: 50,
              child: TextField(
                // onChanged: (value){
                //   username = value;
                // },

                controller: controller.fullname,
                // controller: emailcontroller,
                
                decoration: InputDecoration(
                  
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  prefixIcon: const Icon(Icons.person,
                  color: Colors.grey,
                  size: 17,),
                    labelText: 'Full Name ',
                    labelStyle: const TextStyle(fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15,),
            child: SizedBox(
              height: 50,
              child: TextField(
                controller: controller.email,
                // onChanged: (value) {
                //   username = value;
                // },
                decoration: InputDecoration(
                  
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  prefixIcon: const Icon(Icons.email,
                  color: Colors.grey,
                  size: 17,),
                    labelText: 'Email Address ',
                    labelStyle: const TextStyle(fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SizedBox(
              height: 50,
              child: TextField(
                obscureText: _isObscure,
                controller: passwordcontroller,
                
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                        icon: Icon(
                            _isObscure ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                  
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  prefixIcon: const Icon(Icons.password,
                  color: Colors.grey,
                  size: 17,),
                    labelText: 'Create Password ',
                    labelStyle: const TextStyle(fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SizedBox(
              height: 50,
              child: TextField(
                obscureText: _isObscure,
                controller: confirmpasswordcontroller,
                
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                        icon: Icon(
                            _isObscure ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                  
                  contentPadding: const EdgeInsets.symmetric(vertical:20),
                  prefixIcon: const Icon(Icons.password,
                  color: Colors.grey,
                  size: 17,),
                    labelText: 'Confirm Password ',
                    labelStyle: const TextStyle(fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 1),
            child: SizedBox(
              width: double.infinity,
              height: 50,
            
              child: ElevatedButton(
                onPressed: ()async{
    showDialog(context: context, builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
    try{
    //check if password is confirmed
    if(passwordcontroller.text == confirmpasswordcontroller.text){
      // final User = UserModel(fullName: controller.fullname.text.trim(),
      //  email: controller.email.text.trim(),
      // // phoneNo: controller.phoneNo.text.trim(),
      // // password: controller.password.text.trim()
      // );



      // SignUpController.instance.registerUser(controller.email.text.trim(),controller.password.text.trim());
      // await users.add({'username':usernamecontroller.text}).then((value) => print('added')); 
      // await users.add({'email':emailcontroller.text}).then((value) => print('added'));
      
      await users.doc(controller.email.text.trim()).set({'username':controller.fullname.text.trim(), 'email':controller.email.text.trim()}).then((value) => print("user added"))
      .catchError((error)=>print("Failed to add"));

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: controller.email.text,
      password: passwordcontroller.text,
      ).then((value){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Mobileotp()));
         }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error ${error.toString()}"),
      ));
    }
    
    );
    // SignUpController.instance.createUser(User);
    } else{
      // error message
      showErrorMEssage("Password doesnt match");
    }
      } 
      
      on FirebaseAuthException catch (e){
        Navigator.pop(context);
        showErrorMEssage(e.code);
      }
  },
              style: ElevatedButton.styleFrom(
                // backgroundColor: Color.fromARGB(a, r, g, b)
                backgroundColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
              ),
                 child: const Text('Create Account',
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 14),),),
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const Text('Already have an account?',
             style: TextStyle(fontSize: 14),),
             SizedBox(
               child: TextButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Login()));
               }, child:const Text('Sign In',
               style: TextStyle(fontSize: 14,
               color: Colors.deepPurpleAccent,
               decoration: TextDecoration.underline,
                         ),) ),
             ),
            //  Text(' Sign Up',
            //  style: TextStyle(fontSize: 12,
            //  color: Colors.deepPurpleAccent,
            //  decoration: TextDecoration.underline,
            // ),)
            
          ],)
        ]),
      ),
    ),
          )
          
        ],),
    );
  }
}