import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context, String text, String messageContent,
    Function()? onPressed) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
          content: Text(messageContent),
          actions: [TextButton(onPressed: onPressed, child: const Text("Ok"))],
        );
      });
}
