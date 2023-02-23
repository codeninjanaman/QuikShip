import 'package:flutter/material.dart';

class sendparcel extends StatefulWidget {
  const sendparcel({super.key});

  @override
  State<sendparcel> createState() => _sendparcelState();
}

class _sendparcelState extends State<sendparcel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('send parcel'),
      ),
    );
  }
}