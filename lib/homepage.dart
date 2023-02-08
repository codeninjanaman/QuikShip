import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quikshipnew/pehlapage.dart';
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
      return Center(
        child: CircularProgressIndicator(),
      );
    });
    try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailcontroller.text,
      password: passwordcontroller.text,
      ).then((value){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Pehlapage()));
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
            child: SizedBox(
              height: 40,
              child: TextField(
                controller: emailcontroller,
                
                decoration: InputDecoration(
                  
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Icon(Icons.person,
                  color: Colors.grey,
                  size: 17,),
                    labelText: 'Enter Email ',
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
            padding: const EdgeInsets.only(bottom: 8),
            child: SizedBox(
              height: 40,
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
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Icon(Icons.password,
                  color: Colors.grey,
                  size: 17,),
                    labelText: 'Password ',
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
            padding: const EdgeInsets.only(bottom: 1),
            child: SizedBox(
              width: double.infinity,
              height: 32,
            
              child: ElevatedButton(
                onPressed: signUserIn,
                 child: Text('Sign In',
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
             
              TextButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Signup()));
              }, child:Text(' Sign Up',
               style: TextStyle(fontSize: 12,
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
          )
          
        ],),
    );
  }
}