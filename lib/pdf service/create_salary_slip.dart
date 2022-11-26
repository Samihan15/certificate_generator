import 'dart:io';

import 'package:certificate_generator/pdf%20service/save_pdf.dart';
import 'package:certificate_generator/widget/pdf_widgets.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class GenerateSalarySlip {
  static Future<File> salarySlip() async {
    final pdf = Document();

    final logoImage = MemoryImage(
        (await rootBundle.load('assets/images/logo.jpg')).buffer.asUint8List());

    final font_arial = await rootBundle.load("assets/fonts/Arial.ttf");
    final ttf_arial = Font.ttf(font_arial);

    pdf.addPage(Page(
      build: ((context) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header
              PdfWidgets.header(logoImage: logoImage, ttf_arial: ttf_arial),
              SizedBox(height: 35),
              // table
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "PAY SLIP FOR THE MONTH OF",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                      Text(
                        "June - 2020",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Table(
                border: TableBorder.all(width: 1, color: PdfColor(0, 0, 0)),
                children: [
                  TableRow(
                    children: [
                      Text(' Emp Name'),
                      Text('Chetan Shimpi'),
                      Text(' Pan'),
                      Text('DTDPR2168M'),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(' Emp No'),
                      Text('QT1020'),
                      Text(' Bank A/C No'),
                      Text('50100246387626'),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(' Designation'),
                      Text('Software Engineer'),
                      Text(' Bank'),
                      Text('HDFC Bank'),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(' DOB'),
                      Text('05/08/1996'),
                      Text(' Month - Year'),
                      Text('June - 20'),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(' No of days working'),
                      Text('30'),
                      Text(' Date of Joining'),
                      Text('04/03/2019'),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(' Gross Earnings',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(' Monthly Gross',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(' Deductions',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(' Basic'),
                      Text('18000'),
                      Text(' Professional Tax'),
                      Text('200'),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(' House Rent Allowance'),
                      Text('4500'),
                      Text(' Transport'),
                      Text('0'),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(' Conveyance Allowance'),
                      Text('3000'),
                      Text(' Leave Deduction'),
                      Text('0'),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(' Leave Travel Allowance'),
                      Text('1500'),
                      Text(''),
                      Text(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(' Medical Allowance'),
                      Text('1500'),
                      Text(''),
                      Text(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(' Special Allowance'),
                      Text('1500'),
                      Text(''),
                      Text(''),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(' Gross Salary',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('30000',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(' Total',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('200',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(' '),
                      Text(' '),
                      Text(' '),
                      Text(' '),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(''),
                      Text(''),
                      Text(' Net Salary',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('29800',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("*Note", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                    " This is computer generated pay slip it won't need any seal or signature."),
              ])
            ],
          )),
    ));
    return SavePdf.saveDocument(name: 'salary_slip_EmpId', pdf: pdf);
  }
}
