import 'dart:io';

import 'package:app_merchant_saler/constant.dart';
import 'package:app_merchant_saler/public_components/public_component.dart';
import 'package:app_merchant_saler/screens/dashboard/components/dashboard_body.dart';
import 'package:app_merchant_saler/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DateTime timeBackPressed = DateTime.now();
  String qrCode = 'unknown';

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= const Duration(seconds: 2);

        timeBackPressed = DateTime.now();

        if (isExitWarning) {
          const message = 'Press back again to exit';
          Fluttertoast.showToast(msg: message, fontSize: 14);
          return Future.value(false);
        } else {
          Fluttertoast.cancel();
          return exit(0);
        }
      },
      child: Scaffold(
        body: CustomBackgroundScreen(
          child: SafeArea(
            child: Column(
              children: [
                const Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: DashboardBody(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Dashboard()));
                              });
                            },
                            icon: Column(
                              children: [
                                const Expanded(
                                  child: Icon(
                                    Icons.home_filled,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                Space(height: 2.0),
                                const Expanded(
                                  child: Text(
                                    "Home",
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => scanQRCode(context),
                            child: const CircleAvatar(
                              backgroundColor: kPrimaryColor,
                              maxRadius: 50,
                              child: Icon(
                                Icons.qr_code_scanner,
                                color: kWhiteColor,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Profile()));
                              });
                            },
                            icon: Column(
                              children: [
                                const Expanded(
                                  child: Icon(
                                    Icons.person,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                Space(height: 2.0),
                                const Expanded(
                                  child: Text(
                                    "Profile",
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> scanQRCode(BuildContext context) async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } catch (e) {
      e.toString();
    }
  }
}
