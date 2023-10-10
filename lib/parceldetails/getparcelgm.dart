import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class getparcelgm extends StatelessWidget {
  final String documentId;
  const getparcelgm({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =  FirebaseFirestore.instance.collection('Users');
    return FutureBuilder <DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data = snapshot.data!.data() as Map<String , dynamic>;
          return Text(data['parcel(gm)'], 
          style: const TextStyle(fontSize: 10,
          fontWeight: FontWeight.normal,
          color: Colors.deepPurpleAccent),);
        }
        return const Text('Loading');
      },
    );
  }
}