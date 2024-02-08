import 'package:flutter/material.dart';
import 'package:qbooking/booking/widget/button_booking.dart';
import 'package:qbooking/booking/widget/date_pick.dart';
import 'package:qbooking/feature/filter/widget/equipment_filter.dart';

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
      body:   Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              const Text("Filter Time Your Meet?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              const SizedBox(height: 20,),
             
              const LineChartSample2(),
              const Divider(),
              const DatePickUp(),
              const SizedBox(height: 20,),

              const Text("EQUIPMENT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              const SizedBox(height: 20,),

              const EquipmentFilter(titleEq: 'Capacity',),
              const EquipmentFilter(titleEq: 'TV',),
              const EquipmentFilter(titleEq: 'Board',),
              const EquipmentFilter(titleEq: 'Microphone',),
              const EquipmentFilter(titleEq: 'Speaker',),
              const SizedBox(height: 30,),

              Center(child: ButtonBooking(titleButton: 'Filter', color: Colors.black, titleColor: Colors.white, onTap: () {  },)),

              const SizedBox(height: 30,)
        
              
            ],
          ),
        ),
      ),
    );
  }
}
