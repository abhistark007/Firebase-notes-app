// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebasexnotes/Controllers/notes_controller.dart';
import 'package:firebasexnotes/Models/custom_button.dart';
import 'package:firebasexnotes/Models/notes_model.dart';
import 'package:firebasexnotes/Views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController textEditingController=TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  NotesController notesController=Get.put(NotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        ()=> SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height:30),
                TextField(
                  minLines: 10,
                  maxLines: 50,  // allow user to enter 5 line in textfield
                  keyboardType: TextInputType.multiline,  // user keyboard will have a button to move cursor to next line
                  controller: textEditingController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder:  OutlineInputBorder(),
                    border:  OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 30,),
                notesController.addNotesLoading.value?
                Center(child: CircularProgressIndicator(),)
                :CustomButton(onpressed: () async{
                  notesController.addNotesLoading.value=true;
                  await notesController.addNotes(textEditingController.text,Notes(txt: textEditingController.text));
                  notesController.addNotesLoading.value=false;
                  Get.offAll(()=>HomeScreen());
                }, buttonContent: "Add Task"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}