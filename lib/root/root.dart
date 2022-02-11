import 'package:flutter/material.dart';
import 'package:flutter_toolkit/qr_code_getx/qr_code_page.dart';
import 'package:flutter_toolkit/util/constants.dart';
import 'package:get/get.dart';

/// Creates a nested navigation area for the app so that we can push/pop
/// pages and have them slide properly. This relies on a nested key, and it
/// enables the pages to not be destroyed every time a new one is added.
// ignore: use_key_in_widget_constructors
class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(Constants.navigationKey),
        onGenerateRoute: (RouteSettings settings) {
          // print(settings.name);
          Widget page;
          // Get the page based on the name given
          switch (settings.name) {
            case RouteNames.qrCodePage:
              // print('Creating Devices Page');
              page = const QRCodePage();
              break;
            default:
              // print('Creating Devices Page');
              page = const QRCodePage();
          }

          return GetPageRoute<Widget>(
              routeName: settings.name, page: () => page);
        },
      ),
    );
  }
}
