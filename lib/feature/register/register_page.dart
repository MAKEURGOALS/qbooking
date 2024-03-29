import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:qbooking/feature/auth/widget/custom_text_field.dart';
import 'package:qbooking/feature/auth/widget/icon_login.dart';
import 'package:qbooking/feature/auth/widget/my_button_login.dart';

import '../auth/widget/email_text_field.dart';
import '../login/presentation/screens/login_page.dart';
import 'state/register_state.dart';

// import '../login/presentation/screens/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isObscured = true;

  final emailConttroller = TextEditingController();
  final passwordConttroller = TextEditingController();
  final confirmConttroller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //Sign user in method
  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      if (passwordConttroller.text == confirmConttroller.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailConttroller.text,
          password: passwordConttroller.text,
        );
        if (!context.mounted) return;
        Navigator.pop(context);
      } else {
        Navigator.pop(context);
        showErrorDialog("Passwords do not match.");
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

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
      builder: (context) {
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

  @override
  Widget build(BuildContext context) {
    final registerProvider = context.read<RegisterState>();
    return Scaffold(body: Consumer<RegisterState>(
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
                  'Create your Account',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        EmailTextField(
                          controller: registerProvider.contactController,
                          textfield: 'Email or Phone number',
                          obscureText: false,
                          onPressed: () {},
                        ),

                        CustomTextField(
                          controller: registerProvider.passwordController,
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

                        // confirm password Textfield
                        CustomTextField(
                          controller:
                              registerProvider.confirmPasswordController,
                          textfield: 'Confirm Password',
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
                        const SizedBox(
                          height: 25,
                        ),
                        Mybutton(
                            text: 'Sign Up',
                            onTap: () {
                              if(_formKey.currentState!.validate()){
                              context.read<RegisterState>().register(context);
                              }
                            }),
                      ],
                    )),

                const SizedBox(
                  height: 25,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                  indent: 80,
                  endIndent: 80,
                ),

                const SizedBox(
                  height: 25,
                ),

                const Text(
                  'Or sign up with',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                const SizedBox(
                  height: 35,
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
                    const Iconlogin(
                      imagepaht: 'assets/iconslogo/facebook.png',
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already Have an Account?",
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: const Text(
                        "Login Now",
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
    ));
  }
}
