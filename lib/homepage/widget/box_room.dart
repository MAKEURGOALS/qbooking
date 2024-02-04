import 'package:flutter/material.dart';

class BoxRoomHomePage extends StatefulWidget {
  const BoxRoomHomePage(
      {super.key,
      required this.roomstate,
      required this.changeimage,
      required this.statusRoom});
  final String roomstate;
  final String changeimage;
  final bool statusRoom;

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
                    Image.asset(widget.changeimage),
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
                          if (widget.statusRoom == true)
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
                          const Expanded(
                            child: Text(
                              'This room is equipped with all the necessary equipment for lectores, meeting and negotiating',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                          const Icon(Icons.star_border_sharp),
                          Text(widget.roomstate)
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
