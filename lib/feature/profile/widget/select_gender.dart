import 'package:flutter/material.dart';

class SelectGender extends StatefulWidget {
  final String selectedGender;
  final Function(String value) onSelectGender;
  const SelectGender({super.key, required this.selectedGender, required this.onSelectGender});

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  String? dropdownValue;
  @override
  void initState() {
    dropdownValue = widget.selectedGender;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            hint: const Text('Gender'),
            onChanged: (String? newValue) {
              setState(() {
                widget.onSelectGender(newValue ?? "");
                dropdownValue = newValue;
              });
            },
            items: <String>['Male', 'Female', 'Other']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
