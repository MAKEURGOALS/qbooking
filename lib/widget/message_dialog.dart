import 'package:flutter/material.dart';

void messageDialod({
  required BuildContext context,
  required String message,
}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: SizedBox(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(message, style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Ok'))
            ],
          ),
        ),
      );
    },
  );
}
