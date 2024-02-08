import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qbooking/feature/auth/login_or_register.dart';
import 'package:qbooking/feature/dashboard/dashboard_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is Login
          if (snapshot.hasData){
            return  const DashboardScreen();
          }
          else {
            return  const LoginOrRegister();
          }
        } ,
       ),
    );
  }
}