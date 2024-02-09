import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

class DatePickUp extends StatefulWidget {
  const DatePickUp({super.key});

  @override
  State<DatePickUp> createState() => _DatePickUpState();
}

class _DatePickUpState extends State<DatePickUp> {
  DateTime selectedDate = DateTime.now();
  DatePickerController datePickerController = DatePickerController();
  Key dateTimeKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        const Text("When's your meet?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        const SizedBox(height: 15,),
        InkWell(
          onTap: () async {
            final DateTime? dateTime = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime.now(),
                lastDate: DateTime(3000));
            if (dateTime != null && dateTime != selectedDate) {
              setState(() {
                selectedDate = dateTime;
                datePickerController.animateToDate(dateTime);
                datePickerController.setDateAndAnimate(dateTime);
                dateTimeKey = UniqueKey();
              });
            }
          },
          
          child: Row(
            children: <Widget>[
              
              const Icon(Icons.date_range_outlined),
              Text(
                  "${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}",style: const TextStyle(fontWeight: FontWeight.bold),), 
                  
              const Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DatePicker(
                  key: dateTimeKey,
                  DateTime.now(),
                  height: 90,
                  controller: datePickerController,
                  initialSelectedDate:  DateTime.now(),
                  selectionColor: Colors.black,
                  selectedTextColor: Colors.white,
                  onDateChange: (dateTime) {
                    setState(() {
                      selectedDate = dateTime;
                      dateTimeKey = UniqueKey();
                    });
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
