import 'package:flutter/material.dart';

class ButtonProfile extends StatelessWidget {
  const ButtonProfile(
      {super.key,
      required this.textEdit,
      required this.icon,
      required this.onPress});
  final String textEdit;
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ListTile(
        onTap: onPress,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.blue.withOpacity(0.1)),
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
        title: Text(textEdit),
        trailing: const Icon(Icons.arrow_forward),
      ),
    );
  }
}