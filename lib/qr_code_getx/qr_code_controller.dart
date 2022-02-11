import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeController extends GetxController {
  QRViewController? qrController;

  Rx<Barcode> scannedData = Barcode('', BarcodeFormat.qrcode, <int>[]).obs;

  /// Resets the camera value
  void resetCamera() {
    if (qrController != null) {
      if (Platform.isAndroid) {
        qrController!.pauseCamera();
      } else if (Platform.isIOS) {
        qrController!.resumeCamera();
      }
    }
  }

  /// Called when the QR View is embedded into the screen
  /// Sets up a stream to update the [scannedData] value
  void onQRViewCreated(QRViewController controller) {
    qrController = controller;
    controller.scannedDataStream.listen((scanData) {
      scannedData.value = scanData;
    });
  }

  /// Logs when permissions are set, and displays an error if the user did not
  /// provide permission to access the camera.
  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No Camera Permissions')),
      );
    }
  }
}
