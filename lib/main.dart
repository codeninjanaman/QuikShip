import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quikshipnew/navigationbar/hoemepage.dart';
import 'package:quikshipnew/navigationbar/profile.dart';
import 'package:quikshipnew/navigationbar/publishtravel.dart';
import 'package:quikshipnew/navigationbar/sendparcel.dart';
import 'package:quikshipnew/splash.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: AuthPage(),
      home: splash(),
    );
  }

}

class navigationpage extends StatefulWidget {
  const navigationpage({super.key});

  @override
  State<navigationpage> createState() => _navigationpageState();
}

class _navigationpageState extends State<navigationpage> {
  int _selectedIndex = 0;
  final List<String> _titles = [
    'Home',
    'Send Parcel',
    'Accept Parcel',
    'profile'
  ];
  final List _tabs = [const Pehlapage(), const sendparcel(), 
  const publishtravel(),
  const profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(_titles[_selectedIndex])),
      body: _tabs[_selectedIndex],
      bottomNavigationBar: Material(
        elevation: 60,
        child: Container(
          // decoration: BoxDecoration(
          // border: Border.all(color: Colors.black)
          // ),
          // color: Color(0xFF6361EC),
          
          color: const Color(0xFF6361EC),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            child: GNav(
                onTabChange: (newIndex) =>
                    setState(() => _selectedIndex = newIndex),
                backgroundColor: const Color(0xFF6361EC),
                // backgroundColor: Colors.white,
                color: Colors.white,
                activeColor: Colors.white,
                // tabBackgroundColor: Colors.blue.shade700,
                tabBackgroundColor: const Color(0xFF6361EC),
                gap: 7,
                padding: const EdgeInsets.all(8),
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: ('Home'),
                  ),
                  GButton(
                    icon: Icons.send,
                    text: ('Send Parcel'),
                  ),
                  GButton(
                    icon: Icons.access_time_sharp,
                    text: ('Publish Travel'),
                  ),
                  GButton(
                    icon: Icons.person,
                    text: ('profile'),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}


