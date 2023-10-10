import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quikshipnew/storage/signupcontroller.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class textfieldsuggest extends StatefulWidget {
  const textfieldsuggest({super.key});

  

  @override
  State<textfieldsuggest> createState() => _textfieldsuggestState();
}

class _textfieldsuggestState extends State<textfieldsuggest> {

  TextEditingController fromcontroller = TextEditingController();
  var uuid = const Uuid();

  String sessiontoken = '123456';
  List<dynamic> placesList = [];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fromcontroller.addListener(() {
      onChange();
    });
  }

  void onChange(){
    if(sessiontoken == null){
      setState(() {
        sessiontoken = uuid.v4(); 
      }); //device id store
    }

    getSuggestion (fromcontroller.text);
  }

  void getSuggestion(String input)async{
    String placesApi = "AIzaSyD6VgzFl9j9ScV9OQoFEdhha6znWPFTo4E";
    String baseURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request = '$baseURL?input=$input&key=$placesApi&sessiontoken=$sessiontoken';
    var response = await http.get(Uri.parse(request));
    var data = response.body.toString();
    
    print(data);
    print(response.body.toString());
    if(response.statusCode == 200){
      setState(() {
        placesList = jsonDecode(response.body.toString()) ['predictions'];
      });
    }
    else{
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return TextField(
                
                controller: controller.fromlocation,
                  decoration: InputDecoration(
                    hintText: 'From :',
                    hintStyle: const TextStyle(fontSize: 12),
                    fillColor: Colors.white,
                    filled: true,  
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      prefixIcon: const Icon(Icons.location_on,
                      color: Colors.grey,
                      size: 17,),
                        // labelText: 'From :',
                        // labelStyle: TextStyle(fontSize: 12),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                      
                        )
                        ),
                  );
// TextFormField(
//       controller: fromcontroller,
//       decoration: InputDecoration(
//         hintText: 'From',
//         hintStyle: TextStyle(
//           fontSize: 12
//         ),
//         fillColor: Colors.white,
//         filled: true,
//         contentPadding: EdgeInsets.symmetric(vertical: 10),
//                       prefixIcon: Icon(Icons.car_rental,
//                       color: Colors.grey,
//                       size: 17,)

//       ),
//     );
  }
}