import 'package:flutter/material.dart';

class TextContainerUser extends StatelessWidget {
  const TextContainerUser({super.key, required this.titleCon, required this.iconContainer, required this.endtitleCon});
  final String titleCon;
  final IconData iconContainer;
  final String endtitleCon;

  

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              Icon(iconContainer, color: Colors.white,),
              const SizedBox(width: 15,),
               Text(
                titleCon,
                style: const TextStyle(color: Colors.white),
              ),
          
              
              ],
          ),
        ),
        Text(
          endtitleCon,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
