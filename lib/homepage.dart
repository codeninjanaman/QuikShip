import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quikshipnew/main.dart';
import 'package:quikshipnew/signuppage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {
  bool _isObscure = true;
  bool? check3 = false;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  void signUserIn() async{
    showDialog(context: context, builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
    try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailcontroller.text,
      password: passwordcontroller.text,
      ).then((value){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const navigationpage()));
         });
      
      } on FirebaseAuthException catch (e){
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
        style: const TextStyle(color: Colors.white),)),
      );
    });
  }
  
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
         child: Stack(
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
                        padding: EdgeInsets.only(top: 200),
                        child: Text('Sign in to your account !',
                        style: TextStyle(fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),),
                      ),
                    ),
                    // const Align(
                    //   alignment: Alignment.center,
                    //   child: Padding(
                    //     padding: EdgeInsets.only(top: 10),
                    //     child: Text('Account',
                    //     style: TextStyle(fontSize: 40,
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.bold),),
                    //   ),
                    // ),
                    // const Align(
                    //   alignment: Alignment.topLeft,
                    //   child: Padding(
                    //     padding: EdgeInsets.only(left: 15),
                    //     child: Text('Sign in to deliver your package fast',
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
              padding: const EdgeInsets.only(top: 310,left: 350,right: 350,bottom: 90),
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
                  controller: emailcontroller,
                  
                  decoration: InputDecoration(
                    
                    contentPadding: const EdgeInsets.symmetric(vertical: 20),
                    prefixIcon: const Icon(Icons.person,
                    color: Colors.grey,
                    size: 17,),
                      labelText: 'Enter Email ',
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
                  controller: passwordcontroller,
                  obscureText: _isObscure,
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
                      labelText: 'Password ',
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
            //  Padding(
            //   padding: EdgeInsets.only(bottom: 20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text('Remember Me',
            //       style: TextStyle(fontSize: 14),),
            //       Text('forgot password?',
            //       style: TextStyle(fontSize:14,
            //       fontStyle: FontStyle.italic),)
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                width: double.infinity,
                height: 50,
              
                child: ElevatedButton(
                  onPressed: signUserIn,
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Color.fromARGB(a, r, g, b)
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(10),
           ),
                ),
                   child: const Text('Sign In',
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 14),),),
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text('Do not have an account?',
               style: TextStyle(fontSize: 14),),
               
                TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Signup()));
                }, child:const Text(' Sign Up',
                 style: TextStyle(fontSize: 14,
                 color: Colors.deepPurpleAccent,
                 decoration: TextDecoration.underline,
                           ),) ),
               
              //  Text(' Sign Up',
              //  style: TextStyle(fontSize: 12,
              //  color: Colors.deepPurpleAccent,
              //  decoration: TextDecoration.underline,
              // ),)
            ],)
          ]),
             ),
           ),
            ),
            SizedBox(
              height: 500,
            )
            
          
          ],),
       ),
    );
  }
}