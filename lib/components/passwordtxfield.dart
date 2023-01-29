import 'package:flutter/material.dart';

class pswdfield extends StatefulWidget {
  final controller;
  const pswdfield({super.key,
  this.controller});

  @override
  State<pswdfield> createState() => _pswdfieldState();
}

class _pswdfieldState extends State<pswdfield> {
  bool _isObscure = true;
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
              height: 40,
              child: TextField(
                controller: passwordcontroller,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      }),
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Icon(Icons.password,
                  color: Colors.grey,
                  size: 17,),
                    labelText: 'Password ',
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