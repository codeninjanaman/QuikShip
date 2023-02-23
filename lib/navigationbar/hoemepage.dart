import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:quikshipnew/homepage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Login()));
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        toolbarHeight: 38,
        // backgroundColor: Colors.deepPurpleAccent,
        backgroundColor: Color(0xFF6361EC)
        // color: Color.fromRGBO(234, 239, 243, 1)
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.deepPurple[200],
          child: ElevatedButton(child: Text('logout'),onPressed: signUserOut,),
        ),
      ),
    
      
       body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
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
              alignment: Alignment.topLeft,
              child: Text('Naman',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
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
                            width: double.infinity,
                            child: Image(image: AssetImage(images[index % images.length])), //end image ke bad firse first pe jana
                            height: 200
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
                  padding: const EdgeInsets.only(top: 22,left: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Recent Deliveries',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                    ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 14),
                  child: SingleChildScrollView(
                    child: Container(

                      height: 300,
                      width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100
                    ),
                    child: Column(
                    children: [
                      
                    ],
                    ),
                    ),
                  ),
                )

        ],
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