import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class BarCodeUser extends StatelessWidget {
  final String qrData;
  // final QrCodeModel qrData;
  const BarCodeUser({super.key, required this.qrData});

  @override
  Widget build(BuildContext context) {
    return BarcodeWidget(
      data: qrData,
      barcode: Barcode.code128(),
      color: Colors.white,
      height: 100,
      drawText: true,
    );
  }
}
