// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebasexnotes/Controllers/auth_controller.dart';
import 'package:firebasexnotes/Models/custom_button.dart';
import 'package:firebasexnotes/Models/custom_text_field.dart';
import 'package:firebasexnotes/Views/Auth%20Screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final AuthController authController=Get.put(AuthController());

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
                authController.isLoginLoading.value?Center(child: CircularProgressIndicator())
                :CustomButton(buttonContent: "Login",onpressed: ()async{
                  authController.isLoginLoading.value=true;
                  authController.loginUser(emailController.text, passwordController.text);
                  authController.isLoginLoading.value=false;
                },)
,
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Not a member yet ? ",style: TextStyle(color: Colors.black,fontSize: 15),),
                  InkWell(
                    onTap: (){
                      Get.to(()=>RegisterScreen());
                    },
                    child: Text("Register",style: TextStyle(color: Colors.purple,fontSize: 15,fontWeight: FontWeight.bold),),),
                ],),
              ],
            ),
          ),
        ),
      ),
    );
  }
}