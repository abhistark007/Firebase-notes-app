// ignore_for_file: prefer_const_constructors

import 'package:firebasexnotes/Controllers/auth_controller.dart';
import 'package:firebasexnotes/Models/custom_button.dart';
import 'package:firebasexnotes/Models/custom_text_field.dart';
import 'package:firebasexnotes/Views/Auth%20Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final AuthController authController=Get.find();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Obx(
        ()=> SizedBox(
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
                authController.isRegisterLoading.value?
                Center(child: CircularProgressIndicator(),):
                CustomButton(buttonContent: "Register",onpressed: ()async{
                  authController.isRegisterLoading.value=true;
                  authController.registerUser(emailController.text, passwordController.text);
                  authController.isRegisterLoading.value=true;
                },),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Already a member ? ",style: TextStyle(color: Colors.black,fontSize: 15),),
                  InkWell(
                    onTap: (){
                      Get.to(()=>LoginScreen());
                    },
                    child: Text("Login",style: TextStyle(color: Colors.purple,fontSize: 15,fontWeight: FontWeight.bold),),),
                ],),
              ],
            ),
          ),
        ),
      ),
    );
  }
}