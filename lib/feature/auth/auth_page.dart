import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbooking/feature/dashboard/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/key_storage_constant.dart';
import '../favorite/presentation/state/favorite_room_state.dart';
import '../login/presentation/screens/login_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    // FavoriteRoomState().getFavoriteRoom();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FavoriteRoomState>().getFavoriteRoom();
    });
    super.initState();
  }

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

