import 'dart:io';

import 'package:app_merchant_saler/util/category.dart';
import 'package:app_merchant_saler/util/url_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> generatePdf(
    final PdfPageFormat format, List<dynamic> redeemedList) async {
  final doc = pw.Document(
    title: 'Flutter School',
  );

  final logoImage = pw.MemoryImage(
    (await rootBundle.load('assets/images/logo.png')).buffer.asUint8List(),
  );
  final font = await rootBundle.load('fonts/Gilroy-Regular.ttf');
  final ttf = pw.Font.ttf(font);

  final pageTheme = await _myPageTheme(format);

  doc.addPage(
    pw.MultiPage(
      pageTheme: pageTheme,
      header: (context) => pw.Image(
        alignment: pw.Alignment.topLeft,
        logoImage,
        fit: pw.BoxFit.contain,
        width: 180,
      ),
      build: (context) => [
        pw.Container(
          padding: const pw.EdgeInsets.only(left: 30, bottom: 20),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Padding(
                padding: const pw.EdgeInsets.only(top: 20),
              ),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text(
                        'Phone : ',
                      ),
                      pw.Text(
                        'Email: ',
                      ),
                      pw.Text(
                        'Instagram: ',
                      ),
                    ],
                  ),
                  pw.SizedBox(width: 70),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('0012 340 06789'),
                      UrlText('myFLutterSchool', 'myFlutterSchool@gmail.com'),
                      UrlText('flutter tutorial', '@flutter_tutorial'),
                    ],
                  ),
                  pw.SizedBox(width: 70),
                  pw.BarcodeWidget(
                    data: 'Flutter School',
                    width: 40,
                    height: 40,
                    barcode: pw.Barcode.qrCode(),
                    drawText: false,
                  ),
                  pw.Padding(padding: pw.EdgeInsets.zero),
                ],
              ),
            ],
          ),
        ),
        pw.Center(
          child: pw.Text(
            'Generate Report',
            textAlign: pw.TextAlign.center,
            style: pw.TextStyle(
              font: ttf,
              fontSize: 30,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Align(
          alignment: pw.Alignment.centerLeft,
          child: Category(
            title: 'This Month',
            font: ttf,
          ),
        ),
        _buildTableWidget(redeemedList), // Add this line for the table
      ],
    ),
  );
  return doc.save();
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  final logoImage = pw.MemoryImage(
    (await rootBundle.load('assets/images/logo.png')).buffer.asUint8List(),
  );

  return pw.PageTheme(
    margin: const pw.EdgeInsets.symmetric(
      horizontal: 1 * PdfPageFormat.cm,
      vertical: 0.5 * PdfPageFormat.cm,
    ),
    textDirection: pw.TextDirection.ltr,
    orientation: pw.PageOrientation.portrait,
    buildBackground: (context) => pw.FullPage(
      ignoreMargins: true,
      child: pw.Watermark(
        angle: 20,
        child: pw.Opacity(
          opacity: 0.5,
          child: pw.Image(
            alignment: pw.Alignment.center,
            logoImage,
            fit: pw.BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}

Future<void> saveAsFile(
  final BuildContext context,
  final LayoutCallback build,
  final PdfPageFormat pageFormat,
) async {
  final bytes = await build(pageFormat);

  final appDocDir = await getApplicationDocumentsDirectory();
  final appDocPath = appDocDir.path;
  final file = File('$appDocPath/document.pdf');
  print('save as file ${file.path}...');

  await file.writeAsBytes(bytes);
  await OpenFile.open(file.path);
}

void showPrintedToast(final BuildContext context) {
  Fluttertoast.showToast(
    msg: 'Document Printed Successfully',
    fontSize: 14,
  );
}

void showSharedToast(final BuildContext context) {
  Fluttertoast.showToast(
    msg: 'Document Shared Successfully',
    fontSize: 14,
  );
}

// New method to create a table
pw.Widget _buildTableWidget(List<dynamic> redeemedList) {
  return pw.Table(
    border: pw.TableBorder.all(color: const PdfColor.fromInt(0xff000000)),
    defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
    children: [
      // Top row of the table
      pw.TableRow(
        children: [
          pw.Container(
            padding: const pw.EdgeInsets.all(8.0),
            child: pw.Text("Date", textAlign: pw.TextAlign.center),
          ),
          pw.Container(
            padding: const pw.EdgeInsets.all(8.0),
            child: pw.Text("Code", textAlign: pw.TextAlign.center),
          ),
          pw.Container(
            padding: const pw.EdgeInsets.all(8.0),
            child: pw.Text("Type", textAlign: pw.TextAlign.center),
          ),
          pw.Container(
            padding: const pw.EdgeInsets.all(8.0),
            child: pw.Text("Value", textAlign: pw.TextAlign.center),
          ),
        ],
      ),
      // Data rows
      for (var redeemedItem in redeemedList)
        pw.TableRow(
          children: [
            pw.Container(
              padding: const pw.EdgeInsets.all(8.0),
              child: pw.Text(
                redeemedItem['usage_date'],
                textAlign: pw.TextAlign.center,
                style: const pw.TextStyle(fontSize: 14),
              ),
            ),
            pw.Container(
              padding: const pw.EdgeInsets.all(8.0),
              child: pw.Text(
                redeemedItem['couponcode'],
                textAlign: pw.TextAlign.center,
                style: const pw.TextStyle(fontSize: 12),
              ),
            ),
            pw.Container(
              padding: const pw.EdgeInsets.all(8.0),
              child: pw.Text(
                redeemedItem['cs_name'],
                textAlign: pw.TextAlign.center,
                style: const pw.TextStyle(fontSize: 14),
              ),
            ),
            pw.Container(
              padding: const pw.EdgeInsets.all(8.0),
              child: pw.Text(
                "RM ${redeemedItem['cs_value']}",
                textAlign: pw.TextAlign.center,
                style: const pw.TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
    ],
  );
}
