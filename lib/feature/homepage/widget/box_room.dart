import 'package:flutter/material.dart';
import 'package:qbooking/constant/image_constant.dart';

import '../../../model/room_model.dart';

class BoxRoomHomePage extends StatefulWidget {
  const BoxRoomHomePage(
      {super.key, required this.roomData
     });

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
    return Center(
      child: Padding(
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
                    Image.asset(widget.roomData.images?[0] ?? ImageConstant.room1 ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                          onTap: toggleFavorite,
                          child:  Icon(
                            isFavorite
                            ? Icons.favorite
                            :Icons.favorite_border_outlined,
                            color: Colors.red,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'IQURI Room',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          if (widget.roomData.isAvailable == true)
                            const Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Colors.green,
                                  size: 10,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'available now',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.green),
                                ),
                              ],
                            )
                          else
                            const Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Colors.red,
                                  size: 10,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Unavailable now',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.red),
                                ),
                              ],
                            )
                        ],
                      ),
                      const Row(
                        children: [
                          Text(
                            'Meeting room 204',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.circle,
                            color: Colors.black,
                            size: 10,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Floor 2')
                        ],
                      ),
                      Row(
                        children: [
                           Expanded(
                            child: Text(
                              widget.roomData.description ??"",
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                          const Icon(Icons.star_border_sharp),
                          Text(widget.roomData.rate as String)
                        ],
                      )
                    ],
                  ), 
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
