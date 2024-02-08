import 'package:flutter/material.dart';

class EquipmentFilter extends StatefulWidget {
  const EquipmentFilter({super.key, required this.titleEq});
  final String titleEq;

  @override
  State<EquipmentFilter> createState() => _EquipmentFilterState();
}

class _EquipmentFilterState extends State<EquipmentFilter> {

  int number = 0;

  void increment(){
    setState(() {
      number++;
    });
  }
  void decrement(){
    setState(() {
      if (number >0 ) {
      number--;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(widget.titleEq, style: const TextStyle(fontSize: 16),),
          Row(
            children: [
              InkWell(
                onTap: () {
                  decrement();
                },
                child: Container(
                  // Color of the circular container
              
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black,
                  ), // Adjust padding as needed
                  child: const Icon(
                    Icons.remove,
                    size: 20.0, // Adjust size as needed
                    color: Colors.white, // Color of the icon
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                ),
                child:  Center(
                  child: Text(
                    "$number",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  increment();
                  
                },
                child: Container(
                  // Color of the circular container
              
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black,
                  ), // Adjust padding as needed
                  child: const Icon(
                    Icons.add,
                    size: 20.0, // Adjust size as needed
                    color: Colors.white, // Color of the icon
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
