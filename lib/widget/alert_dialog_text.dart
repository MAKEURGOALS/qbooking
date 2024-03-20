import 'package:flutter/material.dart';

class AlertDialogText extends StatelessWidget {
  const AlertDialogText({super.key, required this.titleText, required this.messageText});
  final String titleText;
  final String messageText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text(titleText),
      content:  Text(messageText),
      actions: [
        TextButton(onPressed: ()=> Navigator.of(context).pop(), child:const Text('ok'))
      ],
      elevation: 24.0,
    );
  }
}