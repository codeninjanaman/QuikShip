
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quikshipnew/Helpandsupport.dart';
import 'package:quikshipnew/navigationbar/getusername.dart';
import 'package:quikshipnew/navigationbar/getusername2.dart';
import 'package:quikshipnew/navigationbar/profile.dart';

import '../contactus.dart';
import '../storage/signupcontroller.dart';
import 'getemail.dart';

class mainDrawer extends StatelessWidget {
  const mainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 220,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            
            color: const Color(0xFF6361EC),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      width: 100,
                      height: 100,
                    
                      margin: const EdgeInsets.only(top: 30),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit.fitHeight
                          ),
                        
                      ),
                    ),
                  ),
                  getusername2(documentId: controller.email.text.trim()),
                  getemail(documentId: controller.email.text.trim())
                  
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile',
              style: TextStyle(fontSize: 14,
              color: Colors.grey.shade700),),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const profile()));
              },
            ),
          ),
          Container(
            height: 50,
            child: ListTile(
              leading: Icon(Icons.contact_support),
              title: Text('Contact Us',
              style: TextStyle(fontSize: 14,
              color: Colors.grey.shade700),),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const contactus()));
              },
            ),
          ),
          Container(
            height: 50,
            child: ListTile(
              leading: Icon(Icons.support_agent),
              title: Text('Help & Support',
              style: TextStyle(fontSize: 14,
              color: Colors.grey.shade700),),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const helpandsupport()));
              },
            ),
          ),
          
        ],
      )
    );
  }
}