import 'package:certificate_generator/utils/constants.dart';
import 'package:flutter/material.dart';

import '../pdf screens/experience_letter.dart';
import '../pdf screens/increment_letter.dart';
import '../pdf screens/offer_letter.dart';
import '../pdf screens/receipt_format.dart';
import '../pdf screens/releving_letter.dart';
import '../pdf screens/salary_slip.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({Key? key}) : super(key: key);

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Lightorange,
        title: Text("Employee's details"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // student name
              customText('Name : '),
              // student mobile number
              customText('Mobile : '),
              // email
              customText('Email : '),
              // address
              customText('Address : '),
              // qualification
              customText('Qualification : '),
              // passout year
              customText('Passout year : '),
              // course
              customText('Course : '),
              // fees
              customText('Fees : '),
              // pdf buttons for admin
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // experience letter button
                  customButtons('Experience letter', ExperienceLetter()),
                  // Increment letter button
                  customButtons('Increment letter', IncrementLetter()),
                ],
              ),
              // another tow buttons :)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Offer letter button
                  customButtons('Offer letter', OfferLetter()),
                  // Releving letter button
                  customButtons('Releving letter', RelevingLetter()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Salary Slip button
                  customButtons('Salary slip', SalarySlip()),
                  // Receipt format button
                  customButtons('Receipt format', ReceiptFormat())
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // custom buttons
  Widget customButtons(String label, Widget page) {
    return Container(
      width: 140,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        child: Text(label),
      ),
    );
  }

  // custom text
  Widget customText(String label) {
    return Text(
      label,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
