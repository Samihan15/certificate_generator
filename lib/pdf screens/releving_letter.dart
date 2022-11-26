import 'package:certificate_generator/pdf%20service/create_releving_letter.dart';
import 'package:certificate_generator/pdf%20service/save_pdf.dart';
import 'package:certificate_generator/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class RelevingLetter extends StatefulWidget {
  const RelevingLetter({Key? key}) : super(key: key);

  @override
  State<RelevingLetter> createState() => _RelevingLetterState();
}

class _RelevingLetterState extends State<RelevingLetter> {
  TextEditingController _ref = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _designation = TextEditingController();
  TextEditingController _resignation_file = TextEditingController();
  TextEditingController _req_of_resignation = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _designation.dispose();
    _ref.dispose();
    _date.dispose();
    _resignation_file.dispose();
    _req_of_resignation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text('Increment Letter'),
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
                controller: _resignation_file,
                label: 'Date on which employee requested to resign',
              ),
              SizedBox(height: 10),
              textfield(
                controller: _req_of_resignation,
                label: "Date on which employee want's to leave",
              ),
              SizedBox(height: 10),
              textfield(
                controller: _designation,
                label: 'Post of an employee',
              ),
              SizedBox(height: 10),
              Container(
                child: ElevatedButton(
                  child: Text('Generate Releving Letter'),
                  onPressed: () async {
                    final pdfFile = await GenerateRelevingLetter.relevingLetter(
                        ref: _ref.text,
                        date: _date.text,
                        designation: _designation.text,
                        resignation_file: _resignation_file.text,
                        req_of_resignation: _req_of_resignation.text);
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
