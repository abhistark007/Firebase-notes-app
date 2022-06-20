// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasexnotes/Controllers/auth_controller.dart';
import 'package:firebasexnotes/Models/notes_model.dart';
import 'package:get/get.dart';
final AuthController authController=Get.find();
class NotesController extends GetxController{
  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  Rx<bool> addNotesLoading=false.obs;
  Rx<bool> displayNotesoading=false.obs;
  Rx<bool> deleteLoading=false.obs;
  List<Notes> notesList=[];
  List<Notes> deletedList=[];

  // Add Notes
  Future addNotes(String txt,Notes notes)async{
    try{
    //   await firebaseFirestore.collection("notes").doc().set({
    //   "task":txt
    // });
    await firebaseFirestore.collection("notes").doc(authController.firebaseAuth.currentUser!.uid).collection(authController.firebaseAuth.currentUser!.email!).doc().set(notes.toMap(notes));
    Get.snackbar("Successfully", "Notes Added");
    }catch(e){
      Get.snackbar("Error Adding Notes", e.toString());
    }
  }

  // Display Notes
  Future getNotesList()async{
    QuerySnapshot querySnapshot= await firebaseFirestore.collection("notes").doc(authController.firebaseAuth.currentUser!.uid).collection(authController.firebaseAuth.currentUser!.email!).get();
    //notesList=querySnapshot.docs;
    for(var i in querySnapshot.docs){
      notesList.add(Notes(txt: i["goals"]));
      print(i["goals"]);
    }
    return notesList;
  }

  //delete Notes
  Future deleteANote(Notes notes)async{
    try{
    var collection = firebaseFirestore.collection('notes').doc(authController.firebaseAuth.currentUser!.uid).collection(authController.firebaseAuth.currentUser!.email!);
    var snapshot = await collection.where('goals', isEqualTo: notes.txt).get();
    await snapshot.docs.first.reference.delete();
   Get.snackbar("Successfully", "Deleted that task");
    }catch(e){
      Get.snackbar("Error Deleting", e.toString());
    }
  }
}