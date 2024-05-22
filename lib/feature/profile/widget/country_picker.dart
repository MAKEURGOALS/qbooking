import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class CountryPicker extends StatefulWidget {
  final String selectedContry;
  final Function(String) onSelectedContry;
  const CountryPicker({Key? key, required this.selectedContry, required this.onSelectedContry}) : super(key: key);

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  String countryValue = "";

  @override
  void initState() {
    super.initState();
    setState(() {
      countryValue = widget.selectedContry;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CSCPicker(
      // defaultCountry: CscCountry.Laos ,
      currentCountry:countryValue ,
      onCountryChanged: (value) {
        setState(() {
          widget.onSelectedContry(value);
          countryValue = value;
        });
      },
      onCityChanged: (value) {},
      onStateChanged: (value) {},
      showStates: false,
      showCities: false,
      countryDropdownLabel: "Country",
      selectedItemStyle: const TextStyle(fontSize: 20),
    );
  }
}
