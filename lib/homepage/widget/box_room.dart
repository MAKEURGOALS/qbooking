import 'package:flutter/material.dart';

class BoxRoomHomePage extends StatelessWidget {
  const BoxRoomHomePage({super.key, required this.roomstate, required this.changeimage});
  final String roomstate;
  final String changeimage;

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
                Image.asset(changeimage),
                 Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const Row(
                    children: [
                      Text(
                        'IQURI Room',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Row(
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
                            style: TextStyle(fontSize: 13,color: Colors.red),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Row(
                    children: [
                      Text('Meeting room 204',style: TextStyle(fontSize: 13,),),
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
                       Text(roomstate)
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
