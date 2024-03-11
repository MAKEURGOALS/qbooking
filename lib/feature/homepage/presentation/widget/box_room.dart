import 'package:flutter/material.dart';
import '../../data/model/room_model_one_model.dart';
import 'slide_image.dart';

class BoxRoomHomePage extends StatefulWidget {
  const BoxRoomHomePage({super.key, required this.roomData});

  final RoomModel roomData;

  @override
  State<BoxRoomHomePage> createState() => _BoxRoomHomePageState();
}

class _BoxRoomHomePageState extends State<BoxRoomHomePage> {
  bool isFavorite = false;
  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Card(
          child: Column(
            children: [
              SlideImage(roomData: widget.roomData),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.roomData.roomName.toString(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 135,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: widget.roomData.isActiveStatus != false
                                    ? Colors.green
                                    : Colors.red,
                                size: 10,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.roomData.isActiveStatus != false
                                    ? 'available now'
                                    : 'Unavailable now',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: widget.roomData.isActiveStatus != false
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Meeting ${widget.roomData.roomName}',
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(
                          Icons.circle,
                          color: Colors.black,
                          size: 10,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('Floor ${widget.roomData.floor}')
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.roomData.description ?? "",
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                        const Icon(Icons.star_border_sharp),
                        const Text("3.5")
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}