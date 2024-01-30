// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class LogOutPage extends StatelessWidget {
   LogOutPage({super.key});
  bool _isLoggedIn = false;
  Map _userObj = {};
  Future<void> logoutfacebook()async {
    FacebookAuth.instance.login(
      permissions: ["public_profile", "email"]).then((value) {
        FacebookAuth.instance.getUserData().then((userData) {

          setState(() {

          });          
        });
      });
  }
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
  
  void setState(Null Function() param0) {}
}


