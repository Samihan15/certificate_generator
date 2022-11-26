import 'dart:io';

import 'package:certificate_generator/pdf%20service/save_pdf.dart';
import 'package:certificate_generator/widget/pdf_widgets.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class GenerateReceiptFormat {
  static Future<File> receiptFormat({
    required String ref,
    required String date,
    required String designation,
  }) async {
    final pdf = Document();

    final stamp = MemoryImage((await rootBundle.load('assets/images/stamp.jpg'))
        .buffer
        .asUint8List());

    final logoImage = MemoryImage(
        (await rootBundle.load('assets/images/logo.jpg')).buffer.asUint8List());

    final sign = MemoryImage((await rootBundle.load('assets/images/sign2.jpg'))
        .buffer
        .asUint8List());

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
              Header(
                decoration: BoxDecoration(border: Border.symmetric()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // logo
                    Container(
                      height: 70,
                      width: 150,
                      child: Image(
                        logoImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                    // address of questa
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("QUIESTA TECHNOLOGIES PRIVATE LIMITED",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  font: ttf_arial,
                                  fontSize: 11,
                                  color: PdfColor.fromHex('#0000FF'))),
                          Text("2nd FLOOR Prithviraj APARTMENT, NEAR RAU\n",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  font: ttf_arial,
                                  fontSize: 11,
                                  color: PdfColor.fromHex('#0000FF'))),
                          Text("HOTEL, SHIVANE, PUNE - 411 023.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  font: ttf_arial,
                                  fontSize: 11,
                                  color: PdfColor.fromHex('#0000FF'))),
                          Text("MOB - + 91 8208489126 | 9561008143\n",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  font: ttf_arial,
                                  fontSize: 11,
                                  color: PdfColor.fromHex('#0000FF'))),
                        ]),
                  ],
                ),
              ),
              SizedBox(height: 40),
              // ref number
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text('Ref.:- $ref',
                    style: TextStyle(
                      fontSize: 14,
                    )),

                // date
                Text('Date: $date',
                    style: TextStyle(
                      fontSize: 14,
                    )),
              ]),
              SizedBox(height: 45),
              // body
              Row(
                children: [
                  Text(
                    "Student Name: ",
                    style: TextStyle(
                        fontSize: 11,
                        font: ttf_arial,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Samihan",
                    style: TextStyle(
                      fontSize: 11,
                      font: ttf_arial,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("Training Program Enrolled For: ",
                      style: TextStyle(
                          fontSize: 11,
                          font: ttf_times,
                          fontWeight: FontWeight.bold)),
                  Text(
                    "Software Developer ",
                    style: TextStyle(
                      fontSize: 11,
                      font: ttf_arial,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                    ),
                  ),
                  Text("Duration: ",
                      style: TextStyle(
                          fontSize: 11,
                          font: ttf_times,
                          fontWeight: FontWeight.bold)),
                  Text(
                    "NA  ",
                    style: TextStyle(
                      fontSize: 11,
                      font: ttf_arial,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("Total Training Fees:  ",
                      style: TextStyle(
                          fontSize: 11,
                          font: ttf_times,
                          fontWeight: FontWeight.bold)),
                  Text(
                    "10,000  ",
                    style: TextStyle(
                      fontSize: 11,
                      font: ttf_arial,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                    ),
                  ),
                  Text("Paid Fees: ",
                      style: TextStyle(
                          fontSize: 11,
                          font: ttf_times,
                          fontWeight: FontWeight.bold)),
                  Text(
                    "10,000  ",
                    style: TextStyle(
                      fontSize: 11,
                      font: ttf_arial,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                    ),
                  ),
                  Text("Pending Fees: ",
                      style: TextStyle(
                          fontSize: 11,
                          font: ttf_times,
                          fontWeight: FontWeight.bold)),
                  Text(
                    "NIL  ",
                    style: TextStyle(
                      fontSize: 11,
                      font: ttf_arial,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              // sign and stamp
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 30,
                        width: 70,
                        child: Image(sign),
                      ),
                      Text("Authorized Signatory",
                          style: TextStyle(
                              fontSize: 11,
                              font: ttf_arial,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 100),
                  // stamp
                  Container(
                    height: 100,
                    width: 100,
                    child: Image(stamp),
                  )
                ],
              ),
              SizedBox(height: 25),
              // note
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Note: - Fees Once Paid Will be Non-Refundable in any manner",
                    style: TextStyle(
                        fontSize: 11,
                        font: ttf_arial,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          )),
    ));
    return SavePdf.saveDocument(name: 'Receipt_format_name', pdf: pdf);
  }
}
