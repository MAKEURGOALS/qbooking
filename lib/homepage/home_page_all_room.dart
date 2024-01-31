import 'package:flutter/material.dart';

class AllRoomPage extends StatelessWidget {
  const AllRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   title: const Text('All Room'),
          // ),
          body: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
             
                    // color: const Color.fromARGB(255, 170, 71, 71),
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        
                        hintText: 'Where are you going?...',
                        
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            
                        
                            decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30)
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Filtter",style: TextStyle(color: Colors.white),),
                                Icon(
                                  Icons.tiktok,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                        
                        
                      ),
                      
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
