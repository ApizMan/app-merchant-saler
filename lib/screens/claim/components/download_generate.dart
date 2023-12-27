import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';

class User {
  final String name;
  final int age;

  const User({required this.name, required this.age});
}

class DownloadGenerate {
  static Future<File> generateTable() async {
    final pdf = Document();

    final headers = ['Name', 'Age'];

    final users = [
      User(name: 'James', age: 19),
      User(name: 'Sarah', age: 21),
      User(name: 'Emma', age: 28),
    ];
    final data = users.map((user) => [user.name, user.age]).toList();

    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
      Page(
        build: (context) {
          return Text('Hello', style: TextStyle(font: font));
        },
      ),
    );

    return await saveDocument(name: 'my_example.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future<void> openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
