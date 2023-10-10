import 'package:flutter/material.dart';

class contactus extends StatelessWidget {
  const contactus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact us'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 200),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text('You can contact us at -',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text('Address - IKGPTU Mohali Campus -1 , SAS',
                style: TextStyle(
                  fontSize: 16
                ),),
              ),
              Text('Whatsapp - 8627811214',
              style: TextStyle(
                fontSize: 16
              ),)
            ],
          ),
        )
      ),
    );
  }
}