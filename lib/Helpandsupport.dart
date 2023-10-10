import 'package:flutter/material.dart';

class helpandsupport extends StatelessWidget {
  const helpandsupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 200
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text('If you are facing any difficulty with shipping , publishing or any other kind of problem, you may mail us at ',
                style: TextStyle(
                  fontSize: 18
                ),),
              ),
              Text('Mail - quikship@gmail.com',
              style: TextStyle(
                fontSize: 20
              ),),
            ],
          ),
        )
      ),
    );
  }
}