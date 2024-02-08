import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class CountryPicker extends StatefulWidget {
  const CountryPicker({Key? key}) : super(key: key);

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  String countryValue = "";

  @override
  Widget build(BuildContext context) {
    return CSCPicker(
      flagState: CountryFlag.ENABLE,
      onCountryChanged: (value) {
        setState(() {
          countryValue = value;
          
        });
      },
      showStates: false,
      showCities: false,
      countryDropdownLabel: countryValue,
    
    );
  }
}
