// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String buttonContent;
  final VoidCallback onpressed;
  const CustomButton({Key? key,
  required this.onpressed,
  required this.buttonContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 7,
      color: Colors.purple,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onpressed,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(buttonContent,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}