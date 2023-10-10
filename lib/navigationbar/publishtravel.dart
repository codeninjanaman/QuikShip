import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quikshipnew/publishsplash.dart';
import 'package:quikshipnew/suggestplacesfield.dart';
import 'package:get/get.dart';
import '../storage/signupcontroller.dart';

class publishtravel extends StatefulWidget {
  const publishtravel({super.key});

  @override
  State<publishtravel> createState() => _publishtravelState();
}

class _publishtravelState extends State<publishtravel> {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  DateTime _dateTime = DateTime.now();
  DateTime _dateTime2 = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
          title: const Text(
            'Publish your travel',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF6361EC)),
      resizeToAvoidBottomInset: false,
      body:

          // physics: ClampingScrollPhysics(),
          SingleChildScrollView(
        physics:
            const ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 260),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2.2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/Group 26086147.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  color: Colors.deepPurpleAccent,
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, top: 35, bottom: 10),
                        child: Text(
                          'Submit your travel details',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 15, bottom: 38, right: 15),
                        child: Text(
                          'Publish your travel from departure to arrival , So Sender Will be able to contact you ',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                    const Padding(
                        padding:
                            EdgeInsets.only(bottom: 5, left: 15, right: 15),
                        child: SizedBox(height: 40, child: textfieldsuggest()
                            )),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 167, top: 1),
                          child: Container(
                            width: 60,
                            height: 18,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                "${_dateTime2.day}-${_dateTime2.month}-${_dateTime2.year}",
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18, bottom: 10),
                          child: SizedBox(
                            height: 20,
                            width: 100,
                            child: ElevatedButton(
                                onPressed: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2020),
                                          lastDate: DateTime(2024))
                                      .then((value) {
                                    setState(() {
                                      controller.fromdate = value!;
                                      _dateTime2 = value;
                                      // controller.fromdate =value!;
                                    });
                                  });
                                },
                                child: Text(
                                  'Choose Date',
                                  style: TextStyle(fontSize: 9),
                                )),
                          ),
                        ),
                      ],
                    ),

                
                    Padding(
                        padding: const EdgeInsets.only(
                            bottom: 7, left: 15, right: 15),
                        child: SizedBox(
                          height: 40,
                          child: TextField(
                            controller: controller.tolocation,
                            decoration: InputDecoration(
                                hintText: 'To :',
                                hintStyle: const TextStyle(fontSize: 12),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                prefixIcon: const Icon(
                                  Icons.car_rental,
                                  color: Colors.grey,
                                  size: 17,
                                ),
                              
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        )),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 167, top: 1),
                          child: Container(
                            width: 60,
                            height: 18,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                "${_dateTime.day}-${_dateTime.month}-${_dateTime.year}",
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18, bottom: 10),
                          child: SizedBox(
                            height: 20,
                            width: 100,
                            child: ElevatedButton(
                                onPressed: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2020),
                                          lastDate: DateTime(2024))
                                      .then((value) {
                                    setState(() {
                                      controller.toDate = value!;
                                      _dateTime = value;
                                      // controller.fromdate =value!;
                                    });
                                  });
                                },
                                child: Text(
                                  'Choose Date',
                                  style: TextStyle(fontSize: 9),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 130, top: 390),
              child: ElevatedButton(
                  onPressed: () async {
                    await users
                        .doc(controller.email.text.trim())
                        .update({
                          'from location': controller.fromlocation.text.trim(),
                          'to location': controller.tolocation.text.trim(),
                          'from date': controller.fromdate.toString(),
                          'to Date': controller.toDate.toString(),
                          'username': controller.fullname.text.trim(),
                          'email': controller.email.text.trim()
                        })
                        .then((value) => print("user added"))
                        .catchError((error) => print("Failed to add"))
                        .then((value) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => publishsplash()));
                        });
                    // publishsplash();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6361EC),
                  ),
                  child: Text('Publish Travel')),
            )
          ],
        ),
      ),
    );
  }
}
