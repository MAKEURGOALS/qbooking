import 'package:flutter/material.dart';
import 'package:qbooking/feature/login/data/login_remote_data_source.dart';

import '../../../../widget/show_dialog.dart';
import '../../../dashboard/dashboard_screen.dart';

class LoginState with ChangeNotifier {
  final TextEditingController contactController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) async {
    const LoadingDialog().show(context);
    final data = await LoginRemoteDataSource().login(
        contact: contactController.text, password: passwordController.text);
    data.fold((l) {
      const LoadingDialog().hide(context);
      print(l);

      return null;
    }, (r) {
      const LoadingDialog().hide(context);
      print(r);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const DashboardScreen()));
    });
  }
}
