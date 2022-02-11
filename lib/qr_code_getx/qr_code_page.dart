import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_toolkit/components/custom_app_bar.dart';
import 'package:flutter_toolkit/qr_code_getx/qr_code_controller.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return QRCodePageState();
  }
}

class QRCodePageState extends State<QRCodePage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRCodeController controller = Get.put(QRCodeController());

  QRViewController? qrController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Image.asset('assets/oh_icon.png', height: 40),
          ),
          // const SizedBox(height: 40),
          Expanded(
            flex: 4,
            child: _buildQrView(context),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: controller.onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) =>
          controller.onPermissionSet(context, ctrl, p),
    );
  }

  // Platform specific actions for the QR camera
  // Used specifically in hot reload situations
  @override
  void reassemble() {
    super.reassemble();

    controller.resetCamera();
  }

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }
}
