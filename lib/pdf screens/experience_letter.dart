import 'package:certificate_generator/pdf%20service/create_experience_letter.dart';
import 'package:flutter/material.dart';

import '../pdf service/save_pdf.dart';
import '../utils/constants.dart';
import '../widget/custom_textfield.dart';

class ExperienceLetter extends StatefulWidget {
  const ExperienceLetter({Key? key}) : super(key: key);

  @override
  State<ExperienceLetter> createState() => _ExperienceLetterState();
}

class _ExperienceLetterState extends State<ExperienceLetter> {
  TextEditingController _ref = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _from = TextEditingController();
  TextEditingController _to = TextEditingController();
  TextEditingController _designation = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _designation.dispose();
    _ref.dispose();
    _from.dispose();
    _to.dispose();
    _date.dispose();
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
                controller: _from,
                label: 'Date from when employee started working',
              ),
              SizedBox(height: 10),
              textfield(
                controller: _to,
                label: 'Last date of employee in company',
              ),
              SizedBox(height: 10),
              textfield(
                controller: _designation,
                label: 'Post of an employee',
              ),
              SizedBox(height: 10),
              Container(
                child: ElevatedButton(
                  child: Text('Generate Experience Letter'),
                  onPressed: () async {
                    final pdfFile =
                        await GenerateExperienceLetter.experienceLetter(
                            ref: _ref.text,
                            date: _date.text,
                            designation: _designation.text,
                            from: _from.text,
                            to: _to.text);
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
