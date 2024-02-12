import 'package:flutter/material.dart';
import 'package:qbooking/constant/key_storage_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant/image_constant.dart';
import '../../../model/room_model.dart';

class BoxFavorites extends StatefulWidget {
  const BoxFavorites({super.key, required this.roomData});
    final RoomModel roomData;

  @override
  State<BoxFavorites> createState() => _BoxFavoritesState();
}

class _BoxFavoritesState extends State<BoxFavorites> {
   Future<void> saveFavorite(RoomModel roomData) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final favoriteRoomsJson =
          preferences.getString(KeyStorageConstant.favoriteRooms);
      final List<RoomModel> favoriteRooms = favoriteRoomsJson != null
          ? roomsModelFromJson(favoriteRoomsJson)
          : [];
      final listSameRoom =
          favoriteRooms.where((element) => element.id == roomData.id).toList();
      if (listSameRoom.isNotEmpty) {
      } else {
        favoriteRooms.addAll([roomData]);
      }

      preferences.setString(
          KeyStorageConstant.favoriteRooms, roomsModelToJson(favoriteRooms));
      print(preferences.getString(KeyStorageConstant.favoriteRooms));
    } catch (e) {
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return   Center(
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
                    Image.asset(
                        widget.roomData.images?[0] ?? ImageConstant.room1),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                          onTap: () => saveFavorite(widget.roomData),
                          child: const Icon(
                           Icons.favorite
                             ,
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
                              widget.roomData.description ?? "",
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                          const Icon(Icons.star_border_sharp),
                          Text(widget.roomData.rate.toString())
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