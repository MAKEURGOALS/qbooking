import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qbooking/feature/profile/presentation/screen/edit_profile_page.dart';
import 'package:qbooking/feature/profile/presentation/screen/language_home_page.dart';
import 'package:qbooking/feature/profile/presentation/screen/privacy_home_page.dart';
import 'package:qbooking/feature/profile/presentation/screen/term_home_page.dart';
import 'package:qbooking/feature/profile/widget/list_home_page_profile.dart';

import '../../../login/presentation/screens/login_page.dart';

class BodyProfile extends StatelessWidget {
  BodyProfile({super.key});

  // Function to confirm the logout action
  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button to close the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Sign Out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close the dialog
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog first
                await signUserOut(); // Perform the sign out action
                if (!context.mounted) return;
                navigateToLoginPage(context);         // Navigate to the login page after signing out
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.black, // Use red color for the sign out button
              ),
              child: const Text('Sign Out', style: TextStyle(color: Colors.white),),
            ),
          ],
        );
      },
    );
    
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();
// user singOut from app
  Future<void> signUserOut() async {
    await FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
    await FacebookAuth.instance.logOut();
  }

  void navigateToLoginPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        ButtonProfile(
          textEdit: 'Edit Profile',
          icon: Icons.edit,
          onPress: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const EditProfilePage(),
              ),
            );
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Divider(
            color: Color.fromARGB(255, 99, 96, 96),
          ),
        ),
        ButtonProfile(
          textEdit: 'Language',
          icon: Icons.language,
          onPress: () {
            Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const Language(),
                ));
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Divider(
            color: Color.fromARGB(255, 99, 96, 96),
          ),
        ),
        ButtonProfile(
          textEdit: 'Privacy Policy',
          icon: Icons.privacy_tip,
          onPress: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const PrivacyHomePage(),
              ),
            );
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Divider(
            color: Color.fromARGB(255, 99, 96, 96),
          ),
        ),
        ButtonProfile(
          textEdit: 'Terms & Conditions',
          icon: Icons.my_library_books,
          onPress: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const TermHomePage(),
              ),
            );
          },
        ),
        const SizedBox(
          height: 200,
        ),

        // button SignOut
        SizedBox(
          width: 280,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              _showLogoutConfirmationDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, // Background color
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout, color: Colors.white), // Add the logout icon
                SizedBox(width: 8), // Add some space between the icon and text
                Text('LogOut', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
