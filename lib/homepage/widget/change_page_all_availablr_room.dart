import 'package:flutter/material.dart';

class ChangePageAllAndAvailableRoom extends StatelessWidget {
  const ChangePageAllAndAvailableRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25),
      child: Container(
        height: 40,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        
        
        ),
        // decoration: BoxDecoration(borderRadius: BorderRadius.ci rcular(30)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  child: TextButton(
                      onPressed: () {}, child: const Text('All Room')),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                      onPressed: () {}, child: const Text('Available Room')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
