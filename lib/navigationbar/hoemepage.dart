import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';
import 'package:quikshipnew/homepage.dart';
import 'package:quikshipnew/navigationbar/drawer.dart';
import 'package:quikshipnew/navigationbar/getusername.dart';
import 'package:quikshipnew/navigationbar/getusername2.dart';
import 'package:quikshipnew/storage/signupcontroller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quikshipnew/storage/user_model.dart';
import 'package:uuid/uuid.dart';

class Pehlapage extends StatefulWidget {
  const Pehlapage({super.key});

  @override
  State<Pehlapage> createState() => _PehlapageState();
}

class _PehlapageState extends State<Pehlapage> {
  int currentIndex=0;
  final controller =CarouselController();

  List<String> images=["assets/images/slideshow1.png",
  "assets/images/slideshow2.png"];


   Future <void> signUserOut() async{
    await FirebaseAuth.instance.signOut().then((value) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Login()));
    });
  }
  
  @override
  Widget build(BuildContext context) {

    final controller = Get.put(SignUpController());
    
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        toolbarHeight: 38,
        
        backgroundColor: const Color(0xFF6361EC)

      ),
      drawer: 
      const mainDrawer(),
      
       body: SingleChildScrollView(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15,top: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Welcome,', style: TextStyle(
                  fontSize: 16
                ),),
              ),
            ),
          
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.topLeft ,
                child: getusername(documentId: controller.email.text.trim()),
              ),
            ),
            Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: SizedBox(
                        height: 170,
                        child:PageView.builder(
                          onPageChanged: (index){
                            setState(() {
                              currentIndex=index % images.length;
                            });
                          },
                          itemBuilder: (context,index){
                            return SizedBox(
                              width: double.infinity, //end image ke bad firse first pe jana
                              height: 200,
                              child: Image(image: AssetImage(images[index % images.length]))
                              // child: Image(image: AssetImage(images[index])),
                            );
                          })
                        )
                    ),
       
       
                 Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    for(var i =0;i<images.length;i++) buildIndicator(currentIndex ==i)
                  ],),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                    child: SingleChildScrollView(
                      child: Container(
       
                        height: 100,
                        width: double.infinity,
                    
                      child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Lottie.network(
          'https://assets1.lottiefiles.com/packages/lf20_v9t4z3we.json'),
                        )
                      ],
                      ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                    child: SingleChildScrollView(
                      child: Container(
       
                        height: 300,
                        width: double.infinity,
                    
                      child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Lottie.network(
          'https://assets1.lottiefiles.com/packages/lf20_kx6a1byu.json'),
                        )
                      ],
                      ),
                      ),
                    ),
                  ),
       
          ],
         ),
       )
    );
  }
  Widget buildIndicator(bool isSelected){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        height: isSelected ? 8 : 4,
        width: isSelected ? 8 : 4,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.black : Colors.grey
        ),
      ),
    );
  }
}