// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StyledContainer extends StatefulWidget {
  final String txt;
  final VoidCallback voidCallback1;
  final VoidCallback iconButtonFunction;
  const StyledContainer({Key? key,
  required this.iconButtonFunction,
  required this.voidCallback1,
  required this.txt,
  }) : super(key: key);

  @override
  State<StyledContainer> createState() => _StyledContainerState();
}

class _StyledContainerState extends State<StyledContainer> {
  Rx<bool> isChecked=false.obs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child:
          Obx(
            ()=> SizedBox(
              height: 100,
              child: GestureDetector(
                onTap: widget.voidCallback1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(value: isChecked.value, onChanged: (val){isChecked.value=!isChecked.value;}),
                      Text(widget.txt,style: TextStyle(color: Colors.black,fontSize: 20,decoration:isChecked.value?TextDecoration.lineThrough:TextDecoration.none),overflow: TextOverflow.fade,),
                      IconButton(onPressed: widget.iconButtonFunction, icon: Icon(Icons.delete,color: Colors.red,),),
                    ],
                  ),
                ),
              ),
                ),
          ),
      ),
    );
  }
}