import 'package:flutter/material.dart';
import 'package:qbooking/booking/widget/button_booking.dart';
import 'package:qbooking/booking/widget/date_pick.dart';
import 'package:qbooking/filter/widget/equipment_filter.dart';

import 'widget/flow_chart.dart';

class FilterHomePage extends StatelessWidget {
  const FilterHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Filter"),
      ),
      body:  const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text("Filter Time Your Meet?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              SizedBox(height: 20,),
             
              LineChartSample2(),
              Divider(),
              DatePickUp(),
              SizedBox(height: 20,),

              Text("EQUIPMENT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              SizedBox(height: 20,),

              EquipmentFilter(titleEq: 'Capacity',),
              EquipmentFilter(titleEq: 'TV',),
              EquipmentFilter(titleEq: 'Board',),
              EquipmentFilter(titleEq: 'Microphone',),
              EquipmentFilter(titleEq: 'Speaker',),
              SizedBox(height: 30,),

              Center(child: ButtonBooking(titleButton: 'Filter',)),

              SizedBox(height: 30,)
        
              
            ],
          ),
        ),
      ),
    );
  }
}
