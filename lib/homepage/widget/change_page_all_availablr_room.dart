import 'package:flutter/material.dart';

class ChangePageAllAndAvailableRoom extends StatefulWidget {
   const ChangePageAllAndAvailableRoom({super.key, required this.onSelectedIndex});
  final Function(int value) onSelectedIndex ;

  @override
  State<ChangePageAllAndAvailableRoom> createState() => _ChangePageAllAndAvailableRoomState();
}

class _ChangePageAllAndAvailableRoomState extends State<ChangePageAllAndAvailableRoom> {
  int current =0 ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25),
      child: Container(
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
        color:Colors.white,
        
        
        ),
      
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
           
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color:current==0 ? Colors.black: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                      onPressed: () {
                        widget.onSelectedIndex(0);
                        current = 0;
                      }, child:  Text('All Room',style: TextStyle(color:current==0 ?Colors.white :Colors.black,),)),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: current==1 ? Colors.black: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                      onPressed: () {
                        
                        widget.onSelectedIndex(1);
                        current = 1;
                        
                      }, child:  Text('Available Room',style: TextStyle(color:current==1 ?Colors.white :Colors.black,),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
