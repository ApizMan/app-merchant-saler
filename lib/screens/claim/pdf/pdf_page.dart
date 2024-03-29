import 'package:app_merchant_saler/resources/resources.dart';
import 'package:app_merchant_saler/util/util.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class PdfPage extends StatefulWidget {
  final List<dynamic> redeemedList;
  final String filter;
  const PdfPage({
    super.key,
    required this.redeemedList,
    required this.filter,
  });

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  PrintingInfo? printingInfo;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final info = await Printing.info();
    setState(() {
      printingInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter PDF'),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: FutureBuilder(
          future: ProfileResources.getProfile(prefix: 'users'),
          builder: (context, profile) {
            return PdfPreview(
              maxPageWidth: 700,
              onPrinted: showPrintedToast,
              onShared: showSharedToast,
              build: (PdfPageFormat format) => generatePdf(
                format,
                widget.redeemedList,
                profile.data['user'],
                widget.filter,
              ),
            );
          }),
    );
  }
}
