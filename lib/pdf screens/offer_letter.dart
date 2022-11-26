import 'package:certificate_generator/pdf%20service/create_offer_letter.dart';
import 'package:flutter/material.dart';

import '../pdf service/save_pdf.dart';
import '../utils/constants.dart';

class OfferLetter extends StatefulWidget {
  const OfferLetter({Key? key}) : super(key: key);

  @override
  State<OfferLetter> createState() => _OfferLetterState();
}

class _OfferLetterState extends State<OfferLetter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: false,
        title: Text('Offer Letter'),
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
                  child: Text('Generate Offer Letter'),
                  onPressed: () async {
                    final pdfFile = await GenerateOfferLetter.offerLetter();
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
