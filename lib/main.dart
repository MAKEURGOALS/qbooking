import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbooking/feature/homepage/state/room_state.dart';
import 'package:qbooking/firebase_options.dart';

import 'feature/auth/auth_page.dart';
import 'feature/login/presentation/state/login_state.dart';
import 'feature/register/state/register_state.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginState()),
        ChangeNotifierProvider(create: (context) => RegisterState()),
        ChangeNotifierProvider(create: (context) => RoomState())
      ],
      child: const MaterialApp(
        home: AuthPage(), // Fix the typo here
      ),
    );
  }
}
