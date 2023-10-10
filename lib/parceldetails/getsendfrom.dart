import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class getsendfrom extends StatelessWidget {
  final String documentId;
  const getsendfrom({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =  FirebaseFirestore.instance.collection('Users');
    return FutureBuilder <DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data = snapshot.data!.data() as Map<String , dynamic>;
          return Text(data['send from'], 
          style: const TextStyle(fontSize: 12,
          fontWeight: FontWeight.bold),);
        }
        return const Text('Loading');
      },
    );
  }
}