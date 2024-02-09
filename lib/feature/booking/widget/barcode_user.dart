import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class BarCodeUser extends StatelessWidget {
  const BarCodeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BarcodeWidget(
      data: "data",
      barcode: Barcode.code128(),
      color: Colors.white,
      height: 100,
      drawText: false,
      
    );
  }
}
