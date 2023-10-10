import 'package:get/get.dart';
import 'package:quikshipnew/storage/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createUser(UserModel User)async{
    await _db.collection("Users").add(User.toJson());
  }

  Future<UserModel> getUserDetails(String email) async{
    final snapshot = await _db.collection("Users").where("Email",isEqualTo: email).get();
    final UserData = snapshot.docs.map((e)=>UserModel.fromSnapshot(e)).single;
    return UserData;
  }

  Future<List<UserModel>> allUser() async{
    final snapshot = await _db.collection("Users").get();
    final UserData = snapshot.docs.map((e)=>UserModel.fromSnapshot(e)).toList();
    return UserData;
  }
}