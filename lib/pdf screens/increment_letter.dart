import 'package:certificate_generator/pdf%20service/create_increment_letter.dart';
import 'package:certificate_generator/pdf%20service/save_pdf.dart';
import 'package:certificate_generator/utils/constants.dart';
import 'package:certificate_generator/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:number_to_words/number_to_words.dart';

class IncrementLetter extends StatefulWidget {
  const IncrementLetter({Key? key}) : super(key: key);

  @override
  State<IncrementLetter> createState() => _IncrementLetterState();
}

class _IncrementLetterState extends State<IncrementLetter> {
  TextEditingController _ref = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _increment = TextEditingController();

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
                  controller: _increment,
                  label: 'Salary incremented by',
                  type: TextInputType.number),
              SizedBox(height: 10),
              Container(
                child: ElevatedButton(
                  child: Text('Generate Increment Letter'),
                  onPressed: () async {
                    final pdfFile =
                        await GenerateIncrementLetter.incrementLetter(
                      date: _date.text,
                      increment: _increment.text,
                      ref: _ref.text,
                    );
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
