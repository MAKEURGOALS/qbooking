import 'package:flutter/material.dart';
import 'package:qbooking/constant/image_path_constant.dart';
// import 'package:qbooking/constant/image_constant.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../constant/key_storage_constant.dart';
// import '../../../model/room_model_one_model.dart';
import '../../../model/room_model_one_model.dart';
// import '../state/room_state.dart';

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
        borderRadius: BorderRadius.circular(30),
        child: Card(
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(15.0),
          // ),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    'https://1399-2400-c180-21-ddb7-dbb-1e2a-1577-30e.ngrok-free.app${ImagePathConstant.room}${widget.roomData.images?[0]}',
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                        onTap: toggleFavorite, //saveFavorite(widget.roomData),
                        child: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: Colors.red,
                        )),
                  ),
                ],
              ),
              // room bottom Details
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        widget.roomData.roomName.toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                       Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: widget.roomData.isActiveStatus != null ? Colors.green : Colors.red,
                            size: 10,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.roomData.isActiveStatus !=null ?'available now': 'Unavailable now' ,
                            style: TextStyle(fontSize: 13, 
                            color: widget.roomData.isActiveStatus !=null ? Colors.green : Colors.red),
                          ),
                        ],
                      ),
                    
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
