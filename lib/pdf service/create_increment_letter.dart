import 'dart:io';

import 'package:certificate_generator/pdf%20service/save_pdf.dart';
import 'package:certificate_generator/widget/pdf_widgets.dart';
import 'package:flutter/services.dart';
import 'package:number_to_words/number_to_words.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class GenerateIncrementLetter {
  static Future<File> incrementLetter({
    required String ref,
    required String date,
    required String increment,
  }) async {
    final pdf = Document();
    final word = int.parse(increment);
    final word_increment = NumberToWord().convert('en-in', word);

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
                  Text(
                    'Sub: Increment Letter',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationThickness: 3,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // name of employee
              Text('Dear Chetan,',
                  style: TextStyle(fontSize: 12, font: ttf_times)),
              SizedBox(height: 20),
              // body
              Text(
                  "We congratulate you for your hard work, enthusiasm, dedication and continuous effort in \nmeeting the organization objective. On reviewing your performance for the year 2019 we are \nglad to announce an increment of INR $increment (Indian Rupees $word_increment) on your existing salary (INR 20,000) with effect from 05th March 2020. From the effective date your salary will \nbe Rs.30,000.",
                  style: TextStyle(fontSize: 12, font: ttf_times)),
              SizedBox(height: 10),
              Text(
                  "We expect you to keep up your performance in the years to come and grow with the organization. \nPlease sign and return the duplicate copy in token of your acceptance, for your records. Wish you \nall the best.",
                  style: TextStyle(fontSize: 12, font: ttf_times)),
              SizedBox(height: 40),
              // sign and stamp
              PdfWidgets.row(ttf_times: ttf_times, sign: sign, stamp: stamp),
            ],
          )),
    ));
    return SavePdf.saveDocument(name: 'Increment_letter_EmpId', pdf: pdf);
  }
}
