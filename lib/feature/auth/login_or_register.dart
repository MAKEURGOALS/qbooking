import 'package:flutter/material.dart';
import 'package:qbooking/feature/login/presentation/screens/login_page.dart';
import 'package:qbooking/feature/register/screens/register_page.dart';



class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}
  
class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoingPage = true;

  // toggle between login or register page
  void togglePage(){
    setState(() {
      showLoingPage = !showLoingPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoingPage) {
      return LoinPage(onTap: togglePage);
      
    }else {
      return RegisterPage(onTap:togglePage);
    }
  }
}