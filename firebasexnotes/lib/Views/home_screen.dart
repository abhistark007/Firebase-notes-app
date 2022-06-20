// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebasexnotes/Models/custom_button.dart';
import 'package:firebasexnotes/Views/add_notes_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: SizedBox(
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

          ],
        ),
      ),
      floatingActionButton: CustomButton(onpressed: (){
        Get.to(()=>AddNoteScreen());
      }, buttonContent: "Add Notes"),
    );
  }
}