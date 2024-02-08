import 'package:flutter/material.dart';
import 'package:qbooking/feature/homepage/widget/filter_button.dart';

class CustomSerachBar extends StatelessWidget {
  const CustomSerachBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Where are you going?...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                suffixIcon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FilterButton()
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
