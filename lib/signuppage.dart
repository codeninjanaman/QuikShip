import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quikshipnew/homepage.dart';
import 'package:quikshipnew/mobileotp.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}


class _SignupState extends State<Signup> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  void signUserup() async{
    showDialog(context: context, builder: (context){
      return Center(
        child: CircularProgressIndicator(),
      );
    });
    try{
    //check if password is confirmed
    if(passwordcontroller.text == confirmpasswordcontroller.text){
      
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailcontroller.text,
      password: passwordcontroller.text,
      ).then((value){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Mobileotp()));
         }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error ${error.toString()}"),
      ));
    });
    } else{
      // error message
      showErrorMEssage("Password doesnt match");
    }
      } 
      
      on FirebaseAuthException catch (e){
        Navigator.pop(context);
        showErrorMEssage(e.code);
      }
      
  }

  void showErrorMEssage(String message){
    showDialog(context: context, builder: (context){
      return
      AlertDialog(
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(child: Text(message,
        style: TextStyle(color: Colors.white),)),
      );
    });
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
                      child: Text('Sign Up and Ship',
                      style: TextStyle(fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,bottom: 7),
                      child: Text('with Travellers',
                      style: TextStyle(fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300,left: 15,right: 15,bottom: 90),
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
            child: SizedBox(
              height: 40,
              child: TextField(
                // controller: emailcontroller,
                
                decoration: InputDecoration(
                  
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Icon(Icons.person,
                  color: Colors.grey,
                  size: 17,),
                    labelText: 'Full Name ',
                    labelStyle: TextStyle(fontSize: 12),
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
              height: 40,
              child: TextField(
                controller: emailcontroller,
                
                decoration: InputDecoration(
                  
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Icon(Icons.email,
                  color: Colors.grey,
                  size: 17,),
                    labelText: 'Email Address ',
                    labelStyle: TextStyle(fontSize: 12),
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
              height: 40,
              child: TextField(
                obscureText: true,
                controller: passwordcontroller,
                
                decoration: InputDecoration(
                  
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Icon(Icons.password,
                  color: Colors.grey,
                  size: 17,),
                    labelText: 'Create Password ',
                    labelStyle: TextStyle(fontSize: 12),
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
              height: 40,
              child: TextField(
                obscureText: true,
                controller: confirmpasswordcontroller,
                
                decoration: InputDecoration(
                  
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Icon(Icons.password,
                  color: Colors.grey,
                  size: 17,),
                    labelText: 'Confirm Password ',
                    labelStyle: TextStyle(fontSize: 12),
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
              height: 32,
            
              child: ElevatedButton(
                onPressed: signUserup,
                 child: Text('Create Account',
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
             Text('Already have an account?',
             style: TextStyle(fontSize: 12),),
             SizedBox(
               child: TextButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Login()));
               }, child:Text(' Sign In',
               style: TextStyle(fontSize: 12,
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