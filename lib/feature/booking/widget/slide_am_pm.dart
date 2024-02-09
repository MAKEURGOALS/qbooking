import 'package:flutter/material.dart';

class SliderAmAndPm extends StatefulWidget {
  const SliderAmAndPm({super.key});

  @override
  State<SliderAmAndPm> createState() => _SliderAmAndPmState();
}

class _SliderAmAndPmState extends State<SliderAmAndPm> {
  int segmentedControlGroupValue = 0;
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text("AM"),
    1: Text("PM")
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSegment(0, "AM"),
        _buildSegment(1, "PM"),
      ],
    );
  }

  Widget _buildSegment(int value, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          segmentedControlGroupValue = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: segmentedControlGroupValue == value ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: segmentedControlGroupValue == value ? Colors.white : Colors.black,
          ),
        ),
      ),
      
    );
  }
}
