// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  const CustomTextField({
    Key? key,
    this.obscureText=false,
    required this.labelText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 25.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: Offset(
              15.0, // Move to right 10  horizontally
              15.0, // Move to bottom 10 Vertically
            ),
          ),
        ],
      ),
      child: TextFormField(
        cursorColor: Colors.purple,
        obscureText: obscureText,
        controller: controller,
        
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.purple),
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          hoverColor: Colors.white,
          labelText: labelText,
          
          //suffixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
          enabledBorder: OutlineInputBorder(
            gapPadding: 5,
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.purple),),
          border: OutlineInputBorder(
            gapPadding: 5,
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.purple)),
          focusedBorder: OutlineInputBorder(
            gapPadding: 5,
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.purple)),
        ),
      ),
    );
  }
}
