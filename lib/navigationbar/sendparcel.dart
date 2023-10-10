import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quikshipnew/sendparcelsplash.dart';

import '../storage/signupcontroller.dart';

class sendparcel extends StatefulWidget {
  const sendparcel({super.key});

  @override
  State<sendparcel> createState() => _sendparcelState();
}

class _sendparcelState extends State<sendparcel> {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  _sendparcelState() {
    _kgSelectedvalue = _weightlistkg[0];
  }

  final _weightlistkg = ["1kg", "2kg", "3kg", "4kg", "5kg"];
  final _weightlistgm = ["100g", "200g", "300g", "400g", "500g"];
  final _fromList = ["Chandigarh", "Ropar", "Zirakpur", "Kharar", "Mohali"];
  final _toList = ["Mandi", "Bilaspur", "Kangra", "Manali", "Panchkula"];
  final _parcelTypeList = [
    "Electronics",
    "Document/Paper",
    "Fragile Sensitive",
    "Edible Products",
    "Metal objects"
  ];
  String? _kgSelectedvalue = "";
  String? _gmSelectedvalue;
  String? _fromSelectedvalue;
  String? _toSelectedvalue;
  String? _parcelSelectedvalue;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
        appBar: AppBar(
            leading: const Icon(Icons.arrow_back),
            title: const Text(
              'Send Parcel',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: const Color(0xFF6361EC)),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: dropDownField(
                          'Parcel Weight', _kgSelectedvalue, _weightlistkg,
                          onChanged: (val) {
                        setState(() {
                          _kgSelectedvalue = val as String;
                          controller.parcelweightkg = val as String;
                        });
                      })),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: dropDownField('', _gmSelectedvalue, _weightlistgm,
                          onChanged: (val) {
                        setState(() {
                          _gmSelectedvalue = val as String;
                          controller.parcelweightgm = val as String;
                        });
                      })),
                ],
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: dropDownField('From', _fromSelectedvalue, _fromList,
                      onChanged: (val) {
                    setState(() {
                      _fromSelectedvalue = val as String;
                      controller.sendfrom = val as String;
                    });
                  })),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: dropDownField('To', _toSelectedvalue, _toList,
                      onChanged: (val) {
                    setState(() {
                      _toSelectedvalue = val as String;
                      controller.sendto = val as String;
                    });
                  })),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: dropDownField(
                      'Parcel Type', _parcelSelectedvalue, _parcelTypeList,
                      onChanged: (val) {
                    setState(() {
                      _parcelSelectedvalue = val as String;
                      controller.parceltype = val as String;
                    });
                  })),
              SizedBox(
                height: 30,
              ),
              Center(
                child: MaterialButton(
                  padding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0)),
                  onPressed: ()async {
                    await users
                        .doc(controller.email.text.trim())
                        .update({
                          'from location': controller.fromlocation.text.trim(),
                          'to location': controller.tolocation.text.trim(),
                          'from date': controller.fromdate.toString(),
                          'to Date': controller.toDate.toString(),
                          'username': controller.fullname.text.trim(),
                          'email': controller.email.text.trim(),
                          'parcel(kg)':controller.parcelweightkg.toString(),
                          'parcel(gm)':controller.parcelweightgm.toString(),
                          'send from':controller.sendfrom.toString(),
                          'send to':controller.sendto.toString(),
                          'parcel type':controller.parceltype.toString(),
                        })
                        .then((value) => print("user added"))
                        .catchError((error) => print("Failed to add"))
                        .then((value) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => sendparcelsplash()));
                        });
                  },
                  child: const Text(
                    'Raise request to Send Parcel',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ));
  }

  dropDownField(String title, String? selectedValue, List<String> list,
      {onChanged}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 60,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                  color: Colors.blue, style: BorderStyle.solid, width: 0.80),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                value: selectedValue,
                hint: const Text('Select'),
                items: list.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      // style: const TextStyle(fontSize: 15),
                    ),
                  );
                }).toList(),
                onChanged: onChanged,
                icon: Icon(
                  Icons.arrow_drop_down_circle,
                  color: Colors.blue.shade200,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}