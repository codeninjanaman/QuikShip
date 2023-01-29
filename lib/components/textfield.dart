import 'package:flutter/material.dart';

class textfield1 extends StatefulWidget {
  final controller;
  const textfield1({super.key,
  this.controller});

  @override
  State<textfield1> createState() => _textfield1State();
}

class _textfield1State extends State<textfield1> {
  final Emailcontroller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
              height: 40,
              child: TextField(
                controller: Emailcontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Icon(Icons.person,
                  color: Colors.grey,
                  size: 17,),
                    labelText: 'Phone Number ',
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
            );
  }
}