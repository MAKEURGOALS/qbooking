import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key, required this.textSetting});
  final String textSetting;

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
            widget.textSetting,
            style: const TextStyle(fontSize: 16),
          ),
          CupertinoSwitch(
            activeColor: Colors.black,
              value: isSwitch,
              onChanged: (value) {
                setState(() {
                  isSwitch = value;
                });
              })
        ],
      );
  }
}
