

import 'package:flutter/material.dart';

import '../../../../widget/show_dialog.dart';
import '../../../widget/show_error_dialog.dart';
import '../../login/presentation/screens/login_page.dart';
import '../data/register_remote_data_source.dart';

class RegisterState with ChangeNotifier {
  final TextEditingController contactController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String? passwordError;
  String? confirmPasswordError;



  bool validatePassword(BuildContext text) {
    if (passwordController.text.length < 6) {
      passwordError = 'Password must be at least 6 characters';
      showErrorDialog(text, "Password must be at least 6 characters");
      return false;
      
    } else {
      passwordError = null;
      return true; 
    }
  }

  bool validateConfirmPassword(BuildContext text) {
    if (confirmPasswordController.text != passwordController.text) {
      confirmPasswordError = "Passwords don't match";
      showErrorDialog(text, "Passwords don't match");
      return false;
    } else {
      confirmPasswordError = null;
      return true;
    }
  }
  

  Future<void> register(BuildContext context) async {
    if (validatePassword(context) && validateConfirmPassword(context)) {
      
      // Password and confirm password are valid, proceed with registration
      const LoadingDialog().show(context);

      try {
        // Call the registration method from your data source
        final data = await RegisterRemoteDataSource().register(
          contact: contactController.text,
          password: passwordController.text,
        );

        // Handle the registration response
        data.fold((left) {
          const LoadingDialog().hide(context);
          print(left);
          // Handle registration error (e.g., show an error message)
        }, (right) {
          const LoadingDialog().hide(context);
          print(right);
           Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginPage()));
          contactController.clear();
          passwordController.clear();
          confirmPasswordController.clear();
          // Registration successful, you can navigate to a different screen or show a success message
        });
      } catch (e) {
        const LoadingDialog().hide(context);
        
        print(e);
        // Handle other potential errors during registration
      }
    } else {
      // Validation failed, show error messages
      notifyListeners(); // Notify listeners to trigger a rebuild in the UI
    }
  }
}



