import 'package:flutter/material.dart';
import 'package:qbooking/feature/filter/filter_home_page.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(30)),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FilterHomePage()));
        },
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Filtter",
              style: TextStyle(color: Colors.white),
            ),
            Icon(
              Icons.access_alarm_sharp,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
