// ignore_for_file: prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  Rx<bool> isRegisterLoading=false.obs;
  Rx<bool> isLoginLoading=false.obs;

  //Register
  Future registerUser(String email,String password) async{
    
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Successfully", "Registered the user");
    }catch(e){
      Get.snackbar("Error Registering User", e.toString());
    }
  }


  //Login
  Future loginUser(String email,String password)async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Successfully", "Logged the user");
    }catch(e){
      Get.snackbar("Error Logging User", e.toString());
    }
  }
}