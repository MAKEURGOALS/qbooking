import 'package:flutter/material.dart';

class TextPictureStatus extends StatelessWidget {
  const TextPictureStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
     
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
       crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "IQURI room",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            Row(
              children: [
                Text("Meeting room 204"),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.circle,
                  size: 10,
                ),
                SizedBox(width: 8,),
                Text("Floor 2")
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 10,
                  color: Colors.green,
                ),
                SizedBox(width: 7,),
                Text(
                  "Available 10am",
                  style: TextStyle(fontSize: 12, color: Colors.green),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.star_border_outlined , size: 25,),
                Text(
                  "4.96"
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
