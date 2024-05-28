import 'package:flutter/material.dart';
import 'package:qbooking/feature/booking/data/model/response_find_many_booking_model.dart';

class BookingBio extends StatelessWidget {
  final RoomId roomData;
  const BookingBio({super.key, required this.roomData});

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
                Text("Floor ${roomData.floor ?? ""}")
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
