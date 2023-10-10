import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
class UserModel {
  final String? id;
  final String fullName;
  final String email;
  // final String phoneNo;
  // final String password;

  const UserModel({
    this.id,
    required this.fullName,
    required this.email,
    // required this.phoneNo,
    // required this.password,
    
  });

  toJson(){
    return{
      "FullName" : fullName,
      "Email" : email,
      // "Phone Number" : phoneNo,
      // "Password" : password,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return UserModel(
      id: document.id,
      fullName: data["FullName"], email: data["Email"]);
  }
}




// Create uuid object
var uuid = Uuid();

// Generate time based id 
// uuid.v1(); // -> 'fqgXzbVRKwmaQ3mHLI5e' //firebase session id added 

// // Generate random id // random id genererated via 
// uuid.v4(); // -> '110ec58a-a0f2-4ac4-8393-c866d813b8d1'

// // Generate email-full name id 
// uuid.v5(uuid.NAMESPACE_URL, ''); // -> 'c74a196f-f19d-5ea9-bffd-a2742432fc9c'

// }