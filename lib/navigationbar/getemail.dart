import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class getemail extends StatelessWidget {
  final String documentId;
  const getemail({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =  FirebaseFirestore.instance.collection('Users');
    return FutureBuilder <DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data = snapshot.data!.data() as Map<String , dynamic>;
          return Text(data['email'], 
          style: const TextStyle(fontSize: 14,
          color: Colors.white
          ),);
        }
        return const Text('Loading');
      },
    );
  }
}