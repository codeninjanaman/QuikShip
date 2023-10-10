import 'package:flutter/material.dart';
import 'package:quikshipnew/acceptparcel.dart';
import 'package:quikshipnew/parceldetails/getparcelgm.dart';
import 'package:quikshipnew/parceldetails/getparcelkg.dart';
import 'package:quikshipnew/parceldetails/getsendfrom.dart';
import 'package:quikshipnew/parceldetails/getsendto.dart';
import 'package:get/get.dart';
import 'package:quikshipnew/storage/signupcontroller.dart';


class allparcels extends StatefulWidget {
  const allparcels({super.key});

  @override
  State<allparcels> createState() => _allparcelsState();
}

class _allparcelsState extends State<allparcels> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Request Raised',
        style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF6361EC)

      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 590),
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Container(
                                    height: 15,
                                    width: 80,
                                    child: Row(
                      children: [
                        Icon(Icons.location_on,
                        size: 16,),
                        getsendfrom(documentId: controller.email.text.trim()),
                      
                      ],
                                    ),
                                  ),
                    ),
                SizedBox(
                  width: 200,
                ),
                Container(
                  height: 15,
                  width: 70,
                  child: Row(
                    children: [
                      Icon(Icons.rocket,
                      size: 16,),
                      getsendto(documentId: controller.email.text.trim()),
                      
                    ],
                  ),
                ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 35,top: 3),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/parcel.png'),
                        fit: BoxFit.fitHeight)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text('____________________.',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    ),),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('Total Weight :',
                style: TextStyle(fontSize: 10),),
                getparcelkg(documentId: controller.email.text.trim()),
                getparcelgm(documentId: controller.email.text.trim())
              ],),
              
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => acceptparcelsplash()));
              },
              style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
               child: Text('Accept'))
              
            ],
          ),
        ),
      )
    );
  }
}