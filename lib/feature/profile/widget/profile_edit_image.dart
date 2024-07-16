import 'package:flutter/material.dart';

class ProfileEditImage extends StatelessWidget {
  const ProfileEditImage({super.key, required this.imageProfile});
  final String imageProfile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Center(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              // Circular profile image
              CircleAvatar(
                radius: 80.0,
                backgroundImage:
                    NetworkImage(imageProfile), // Replace with your image path
              ),
              // Edit icon on top of the profile image
              Positioned(
                bottom: 4,
                right: 4,
                child: CircleAvatar(
                  radius: 18.0,
                  backgroundColor: Colors.black,
                  child: IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white),
                    onPressed: () {
                      // Add edit profile logic here
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
