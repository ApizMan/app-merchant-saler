
import 'package:app_merchant_saler/util/category.dart';
import 'package:app_merchant_saler/util/url_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> generatePdf(
  final PdfPageFormat format,
  List<dynamic> redeemedList,
  Map<String, dynamic> profile,
  String filter,
) async {
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
                        'Merchant Name: ',
                      ),
                      pw.Text(
                        'PIC Name: ',
                      ),
                      pw.Text(
                        'Phone: ',
                      ),
                      pw.Text(
                        'Email: ',
                      ),
                    ],
                  ),
                  pw.SizedBox(width: 70),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(profile['merchant_name']!),
                      pw.Text(profile['merchant_pic']!),
                      pw.Text(profile['merchant_contact']!),
                      UrlText(
                          profile['merchant_email'], profile['merchant_email']),
                    ],
                  ),
                  pw.SizedBox(width: 70),
                  pw.BarcodeWidget(
                    data: profile['merchant_email'],
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
            title: filter != "" ? 'Filter By: $filter' : 'Filter By: All Month',
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
          opacity: 0.35,
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
  double totalValue = 0.0;

  // Calculate the total value
  for (var redeemedItem in redeemedList) {
    totalValue += double.parse(redeemedItem['cs_value']);
  }

  return pw.Table(
    border: pw.TableBorder.all(color: const PdfColor.fromInt(0xff000000)),
    defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
    children: [
      // Top row of the table
      pw.TableRow(
        decoration: const pw.BoxDecoration(
          color: PdfColor.fromInt(0xFF64FFDA),
        ),
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
            child: pw.Text("Value (RM)", textAlign: pw.TextAlign.center),
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
                redeemedItem['cm_usage_date'],
                textAlign: pw.TextAlign.center,
                style: const pw.TextStyle(fontSize: 8),
              ),
            ),
            pw.Container(
              padding: const pw.EdgeInsets.all(8.0),
              child: pw.Text(
                redeemedItem['cm_coupon_code'],
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
                double.parse(redeemedItem['cs_value']).toStringAsFixed(2),
                textAlign: pw.TextAlign.center,
                style: const pw.TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      pw.TableRow(
        decoration: const pw.BoxDecoration(
          color: PdfColor.fromInt(0xFFA7FFEB),
        ),
        children: [
          pw.Container(),
          pw.Container(),
          pw.Container(
            padding: const pw.EdgeInsets.all(8.0),
            child: pw.Text(
              "Total",
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.Container(
            padding: const pw.EdgeInsets.all(8.0),
            child: pw.Text(totalValue.toStringAsFixed(2),
                textAlign: pw.TextAlign.center),
          ),
        ],
      ),
    ],
  );
}
