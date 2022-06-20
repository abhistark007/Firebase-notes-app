// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:firebasexnotes/Controllers/notes_controller.dart';
import 'package:firebasexnotes/Models/custom_button.dart';
import 'package:firebasexnotes/Models/notes_model.dart';
import 'package:firebasexnotes/Models/styled_container_model.dart';
import 'package:firebasexnotes/Views/add_notes_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotesController notesController=Get.put(NotesController());

  late Future noteDataList;
  bool isLoading=false;

  @override
  void initState() {
    noteDataList=notesController.getNotesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body:SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Hi!",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                      Text(", How was your day",style: TextStyle(color: Colors.white,fontSize: 30,),),
                    ],
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    future:isLoading? noteDataList:noteDataList,
                    builder: (context,snapshot){
                      notesController.deleteLoading.value=false;
                      if(!snapshot.hasData){
                        return Center(child: CircularProgressIndicator(),);
                      }else{
                        return ListView.builder(
                          itemCount: notesController.notesList.length,
                          itemBuilder: (context,index){
                            return StyledContainer(iconButtonFunction: (){
                              
                              notesController.deleteANote(Notes(txt: notesController.notesList[index].txt));
                              setState(() {
                                isLoading=!isLoading;
                              });
                            }, voidCallback1: (){}, txt: notesController.notesList[index].txt);
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),

      floatingActionButton: CustomButton(onpressed: (){
        Get.to(()=>AddNoteScreen());
      }, buttonContent: "Add Notes"),
    );
  }
}