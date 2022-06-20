// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebasexnotes/Models/custom_button.dart';
import 'package:firebasexnotes/Models/custom_text_field.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(labelText: "Email", controller: emailController),
              SizedBox(height: 30,),
              CustomTextField(labelText: "Password", controller: passwordController,obscureText: true,),
              SizedBox(height: 50,),
              CustomButton(buttonContent: "Login"),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Not a member yet ? ",style: TextStyle(color: Colors.black,fontSize: 15),),
                InkWell(
                  onTap: (){},
                  child: Text("Register",style: TextStyle(color: Colors.purple,fontSize: 15,fontWeight: FontWeight.bold),),),
              ],),
            ],
          ),
        ),
      ),
    );
  }
}