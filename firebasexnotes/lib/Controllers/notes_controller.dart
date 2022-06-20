import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasexnotes/Controllers/auth_controller.dart';
import 'package:get/get.dart';
final AuthController authController=Get.find();
class NotesController extends GetxController{
  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  Rx<bool> addNotesLoading=false.obs;
  // Add Notes
  Future addNotes(String txt)async{
    try{
    //   await firebaseFirestore.collection("notes").doc().set({
    //   "task":txt
    // });
    await firebaseFirestore.collection("notes").doc(authController.firebaseAuth.currentUser!.uid).collection(authController.firebaseAuth.currentUser!.email!).doc().set({
      "goals":txt
    });
    Get.snackbar("Successfully", "Notes Added");
    }catch(e){
      Get.snackbar("Error Adding Notes", e.toString());
    }
  }
}