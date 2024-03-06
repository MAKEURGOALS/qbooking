import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'package:qbooking/widget/show_dialog.dart';

import '../../../../widget/custom_text_field.dart';
import '../../../../widget/email_text_field.dart';
import '../../../../widget/icon_login.dart';
import '../../../../widget/my_button_login.dart';
import '../../../register/register_page.dart';
import '../state/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoinPageState();
}

class _LoinPageState extends State<LoginPage> {
  bool _isObscured = true;

  final emailConttroller = TextEditingController();
  final passwordConttroller = TextEditingController();

  //Sign user in method
  void signUserIn() async {
    const LoadingDialog().show(context);
    await FirebaseAuth.instance.signOut();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailConttroller.text,
        password: passwordConttroller.text,
      );
      if (!context.mounted) return;
      const LoadingDialog().hide(context);
    } on FirebaseAuthException catch (e) {
      print(e);
      if (!context.mounted) return;

      const LoadingDialog().hide(context);

      String errorMessage = 'An error occurred.';

      if (e.code == 'user_not_found') {
        errorMessage = 'No user found with this email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Incorrect password.';
      }

      // Show a user-friendly error message
      showErrorDialog(errorMessage);
    }
  }

  void showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

// login With google
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      print("Can't sign with google >$e");
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.read<LoginState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Consumer<LoginState>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Column(children: [
                  Image.asset(
                    'assets/images/qbooking.png',
                    width: 184,
                    height: 183,
                  ),
                  const Text(
                    'Login to your Account',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // form input
                  Form(
                    key: formKey,

                      child: Column(
                    children: [
                      EmailTextField(
                        controller: loginProvider.contactController,
                        textfield: 'Email or Phone number',
                        obscureText: false,
                        onPressed: () {},
                      ),
                      CustomTextField(
                        controller: loginProvider.passwordController,
                        textfield: 'Password',
                        icon: _isObscured
                            ? Icons.visibility
                            : Icons.visibility_off,
                        obscureText: _isObscured,
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot Password?',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Mybutton(
                          text: 'Sign In',
                          onTap: () {
                            if ( formKey.currentState!.validate()) {
                              context.read<LoginState>().login(context);
                            }
                                  
                          }),
                    ],
                  )),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                      indent: 80,
                      endIndent: 80,
                    ),
                  ),
                  const Text(
                    'Or sign up with',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // IconBottom
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // IconFaceBook
                      InkWell(
                        onTap: () {
                          signInWithGoogle();
                        },
                        child: const Iconlogin(
                          imagepaht: 'assets/iconslogo/google.png',
                        ),
                      ),

                      const SizedBox(
                        width: 15,
                      ),
                      // icon_Google

                      // faceBook login Button

                      InkWell(
                        onTap: () {
                          signInWithFacebook();
                        },
                        child: const Iconlogin(
                          imagepaht: 'assets/iconslogo/facebook.png',
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't Have an Account?",
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      )
                    ],
                  )
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
