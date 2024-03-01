import 'package:flutter/material.dart';
import 'package:qbooking/feature/dashboard/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/key_storage_constant.dart';
import '../login/presentation/screens/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

// create function pai kuad sorb token
  Future<String?> validationToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(KeyStorageConstant.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: validationToken(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData == true) {
                  return const DashboardScreen();
                } else {
                  return const LoginPage();
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}

//  StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           // user is Login
//           if (snapshot.hasData){
//             return  const DashboardScreen();
//           }
//           else {
//             return  const LoginPage();
//           }
//         } ,
//        ),