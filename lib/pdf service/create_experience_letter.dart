import 'dart:io';

import 'package:certificate_generator/pdf%20service/save_pdf.dart';
import 'package:certificate_generator/widget/pdf_widgets.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class GenerateExperienceLetter {
  static Future<File> experienceLetter({
    required String ref,
    required String date,
    required String designation,
    required String from,
    required String to,
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
              // sub : increment letter
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Experience Certificate',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'To whomsoever it may concern',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 25),
              // body
              Text(
                  "This is to certify that Mr. Omkar Hanumant Desai was an employee of our organization for the post of \n$designation. His association with our company was from $from to $to\n. His Duties included working with Software Testing related activities for different projects.",
                  style: TextStyle(fontSize: 11, font: ttf_times)),
              SizedBox(height: 10),
              Text(
                  "We believe in his potential and would grade him as a performer",
                  style: TextStyle(fontSize: 11, font: ttf_times)),
              SizedBox(height: 10),
              Text("Wish him all the very best for his future endeavors.",
                  style: TextStyle(fontSize: 12, font: ttf_times)),
              SizedBox(height: 40),
              // sign and stamp
              PdfWidgets.row(ttf_times: ttf_times, sign: sign, stamp: stamp),
            ],
          )),
    ));
    return SavePdf.saveDocument(name: 'Experience_letter_EmpId', pdf: pdf);
  }
}
