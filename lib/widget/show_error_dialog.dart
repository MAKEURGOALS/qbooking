
import 'package:flutter/material.dart';

void showErrorDialog (BuildContext context,  String message) {
  showDialog(context: context, builder: (context) {
    return AlertDialog(
      title: const Text("Error"),
      content: Text(message),
      actions: [
        TextButton(onPressed: () {
          Navigator.pop(context);
        }, child: const Text("OK"))
      ],
    );
  });
}

  // void showErrorDialog (BuildContext text, String message){
  //   showDialog(
  //    context: text,
  //    builder: (context) => AlertDialog(
  //     actions: [
  //       TextButton(onPressed: () {
  //         Navigator.pop(context);
  //       }, child: Text("Ok"))
  //     ],
  //     title:   Text(message),
  //    )
      
      
  //   );
  // }