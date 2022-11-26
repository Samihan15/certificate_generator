import 'dart:io';

import 'package:certificate_generator/pdf%20service/save_pdf.dart';
import 'package:certificate_generator/widget/pdf_widgets.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class GenerateRelevingLetter {
  static Future<File> relevingLetter({
    required String ref,
    required String date,
    required String designation,
    required String resignation_file,
    required String req_of_resignation,
  }) async {
    final pdf = Document();

    final stamp = MemoryImage((await rootBundle.load('assets/images/stamp.jpg'))
        .buffer
        .asUint8List());

    final logoImage = MemoryImage(
        (await rootBundle.load('assets/images/logo.jpg')).buffer.asUint8List());

    final sign = MemoryImage(
        (await rootBundle.load('assets/images/sign.jpg')).buffer.asUint8List());

    final font_arial = await rootBundle.load("assets/fonts/Arial.ttf");
    final ttf_arial = Font.ttf(font_arial);

    final font_times = await rootBundle.load("assets/fonts/times.ttf");
    final ttf_times = Font.ttf(font_times);

    pdf.addPage(Page(
      build: ((context) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header
              PdfWidgets.header(logoImage: logoImage, ttf_arial: ttf_arial),
              SizedBox(height: 35),
              // ref number
              Text('Ref.:- $ref',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      font: ttf_times)),
              SizedBox(height: 20),
              // date
              Text('Date: $date',
                  style: TextStyle(fontSize: 12, font: ttf_times)),
              SizedBox(height: 20),
              // name of employee
              Text('Name of employee',
                  style: TextStyle(fontSize: 12, font: ttf_times)),
              SizedBox(height: 5),
              Text('$designation',
                  style: TextStyle(fontSize: 12, font: ttf_times)),
              // name of employee
              SizedBox(height: 20),
              Text('Dear omkar,',
                  style: TextStyle(fontSize: 12, font: ttf_times)),
              SizedBox(height: 20),
              // body
              Text(
                  "This letter is made in reference to your resignation dated on $resignation_file requesting relief of\n your duties on $req_of_resignation. We would like to inform you of acceptance of your resignation\n and thus hereby relieve you of your duties as $designation effective at the close of\n business hours on $req_of_resignation.",
                  style: TextStyle(fontSize: 12, font: ttf_times)),
              SizedBox(height: 20),
              Text(
                  "Your final and full clearance will be issued after 30 days from your effectively date. We thank\n you for the contributions made to the organization and wish you all the best on your future\n undertakings.",
                  style: TextStyle(fontSize: 12, font: ttf_times)),

              SizedBox(height: 24),
              // sign and stamp
              PdfWidgets.row(ttf_times: ttf_times, sign: sign, stamp: stamp),
            ],
          )),
    ));
    return SavePdf.saveDocument(name: 'releving_letter_EmpId', pdf: pdf);
  }
}
