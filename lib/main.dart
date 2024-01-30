import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qbooking/features/auth/auth_page.dart';
import 'package:qbooking/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      home: AuthPage(), // Fix the typo here
    );
  }
}
 