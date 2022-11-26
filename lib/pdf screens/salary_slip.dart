import 'package:flutter/material.dart';

import '../pdf service/create_salary_slip.dart';
import '../pdf service/save_pdf.dart';
import '../utils/constants.dart';

class SalarySlip extends StatelessWidget {
  const SalarySlip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: false,
        title: Text('Salary Slip'),
        backgroundColor: Lightorange,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              SizedBox(height: 10),
              Container(
                child: ElevatedButton(
                  child: Text('Generate Salary Slip'),
                  onPressed: () async {
                    final pdfFile = await GenerateSalarySlip.salarySlip();
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
