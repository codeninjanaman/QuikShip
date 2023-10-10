import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quikshipnew/storage/user_model.dart';
import 'package:quikshipnew/storage/user_repository.dart';
import 'package:uuid/uuid.dart';


class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();
  var uuid = Uuid();
  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNo = TextEditingController();
  final fromlocation = TextEditingController();
  final tolocation = TextEditingController();
  final UserRepo = Get.put(UserRepository());
  var fromdate;
  var toDate;
  var parcelweightkg;
  var parcelweightgm;
  var sendfrom;
  var sendto;
  var parceltype;
  // String getuid(){
  //   return uuid.v1();
  // }
  

  void registerUser(String email, String password){

  }
  // Future <void> createUser(UserModel user)async{
  //   await UserRepository.createUser(user);

  // }
  void createUser(UserModel User)async{
    await UserRepo.createUser(User);

  }
}
