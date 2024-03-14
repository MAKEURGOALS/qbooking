import 'package:flutter/material.dart';
import 'package:qbooking/feature/homepage/data/model/room_model_one_model.dart';

class TextPictureStatus extends StatelessWidget {
  const TextPictureStatus({
    super.key,
    required this.roomData,
  });
  final RoomModel roomData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              roomData.roomName ?? "",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            Row(
              children: [
                Text(
                  roomData.typeRoom ?? "",
                ),
                const SizedBox(
                  width: 15,
                ),
                const Icon(
                  Icons.circle,
                  size: 10,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(roomData.floor ?? "")
              ],
            )
          ],
        ),
        //left side of box
        Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: roomData.isActiveStatus != false
                      ? Colors.green
                      : Colors.red,
                  size: 10,
                ),
                
                Text(
                  roomData.isActiveStatus != false
                      ? 'available now'
                      : 'Unavailable now',
                  style: TextStyle(
                    fontSize: 13,
                    color: roomData.isActiveStatus != false
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Icon(
                  Icons.star_border_outlined,
                  size: 25,
                ),
                Text("4.96")
              ],
            )
          ],
        )
      ],
    );
  }
}
