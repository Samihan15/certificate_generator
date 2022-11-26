// import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfWidgets {
  static header({required logoImage, required ttf_arial}) {
    return Header(
      decoration: BoxDecoration(border: Border.symmetric()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // logo
          Container(
            height: 70,
            width: 120,
            child: Image(
              logoImage,
              fit: BoxFit.fill,
            ),
          ),
          // address of questa
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
    );
  }

  static row({required ttf_times, required sign, required stamp}) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Yours Sincerely,',
                style: TextStyle(fontSize: 12, font: ttf_times)),
            Text("For Quiesta Technologies Pvt. Ltd",
                style: TextStyle(
                    fontSize: 12,
                    font: ttf_times,
                    fontWeight: FontWeight.bold)),
            Container(
              height: 30,
              width: 70,
              child: Image(sign),
            ),
            Text("Abhijeet Salgar.\nCEO",
                style: TextStyle(
                    fontSize: 12,
                    font: ttf_times,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(width: 120),
        // stamp
        Container(
          height: 100,
          width: 100,
          child: Image(stamp),
        )
      ],
    );
  }
}
