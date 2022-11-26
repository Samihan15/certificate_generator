import 'package:certificate_generator/pdf%20service/create_receipt_format.dart';
import 'package:certificate_generator/pdf%20service/save_pdf.dart';
import 'package:certificate_generator/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ReceiptFormat extends StatefulWidget {
  const ReceiptFormat({Key? key}) : super(key: key);

  @override
  State<ReceiptFormat> createState() => _ReceiptFormatState();
}

class _ReceiptFormatState extends State<ReceiptFormat> {
  TextEditingController _ref = TextEditingController();
  TextEditingController _designation = TextEditingController();
  TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text('Receipt Format'),
        backgroundColor: Lightorange,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              textfield(
                  controller: _ref,
                  label: 'Ref number',
                  hint: 'Enter the ref number'),
              SizedBox(height: 10),
              textfield(
                  controller: _date, label: 'Date', hint: 'ex. July 20,2022'),
              SizedBox(height: 10),
              textfield(
                controller: _designation,
                label: 'Designation of employee',
              ),
              SizedBox(height: 10),
              Container(
                child: ElevatedButton(
                  child: Text('Generate Receipt Format'),
                  onPressed: () async {
                    final pdfFile = await GenerateReceiptFormat.receiptFormat(
                        designation: _designation.text,
                        date: _date.text,
                        ref: _ref.text);
                    SavePdf.openFile(pdfFile);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
