import 'dart:io';

import 'package:certificate_generator/pdf%20service/save_pdf.dart';
import 'package:certificate_generator/widget/pdf_widgets.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class GenerateOfferLetter {
  static Future<File> offerLetter() async {
    final pdf = Document();

    final logoImage = MemoryImage(
        (await rootBundle.load('assets/images/logo.jpg')).buffer.asUint8List());

    final stamp = MemoryImage((await rootBundle.load('assets/images/stamp.jpg'))
        .buffer
        .asUint8List());

    final sign = MemoryImage(
        (await rootBundle.load('assets/images/sign.jpg')).buffer.asUint8List());

    final font_arial = await rootBundle.load("assets/fonts/Arial.ttf");
    final ttf_arial = Font.ttf(font_arial);

    final font_times = await rootBundle.load("assets/fonts/times.ttf");
    final ttf_times = Font.ttf(font_times);

    pdf.addPage(
      MultiPage(
        build: (context) => [
          page1(logoImage, ttf_arial),
          page2(logoImage, ttf_arial),
          page3(logoImage, ttf_arial, stamp, sign, ttf_times),
        ],
      ),
    );
    return SavePdf.saveDocument(name: 'salary_slip_EmpId', pdf: pdf);
  }

  static page1(logoImage, ttf_arial) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // logo and address
        PdfWidgets.header(logoImage: logoImage, ttf_arial: ttf_arial),

        // ref number
        SizedBox(height: 10),
        Text("Ref :- ",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        SizedBox(height: 05),
        Text("Date"),
        SizedBox(height: 15),

        // name and adress
        Container(
          width: 180,
          child: Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name:"),
                  Text(
                      "Address : D - 402 Celestial City,Phase 01, Bhondave Vasti, Ravet, Pune 412 101."),
                  Text("Cell No: +91 7083638729."),
                ],
              ),
            ],
          ),
        ),

        // title
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Offer & Onboarding Letter",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2),
            ),
          ],
        ),
        // name
        SizedBox(height: 5),
        Text(
          "Dear Omkar,",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),

        //subject
        Text(
          "Sub: Offer for a Software Engineer Position in our Organization",
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationThickness: 2),
        ),
        SizedBox(height: 5),

        // body
        Wrap(
          children: [
            Text(
                'Pursuant to your interview this month we are pleased to Offer, for a "Software Tester" Position in our Organization. Your Appointment in the Organization will be subject to the following Terms and Conditions:',
                style: TextStyle(fontSize: 12)),
          ],
        ),
        SizedBox(height: 20),

        //date of joining
        Row(
          children: [
            Text(
              "1.	Date of Joining-",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2),
            ),
            Text(
              "No Later than March 07, 2018.",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),

        // Place of work
        Wrap(
          children: [
            Row(
              children: [
                Text(
                  "2. Place of Work-",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2),
                ),
                Text(
                  "Your Base Location will be Pune. Daily reporting of work shall be required\nto be done to the MD.",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),

        // working hours
        Row(
          children: [
            Text(
              "3.	Working Hours -",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2),
            ),
            Text(
              "You have to be available for Company's work from 09:30 AM to 06:30 PM",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        Wrap(
          children: [
            Text(
              "IST from Monday to Saturday (except on Company Holidays). This will include a lunch/ tea/personal break which should not exceed one hour. At times you may be required to attend work on Sundays if required. The work hours can be made flexible with mutual consent as long as you put in minimum of 45 hours per week.",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),

        // Reporting
        Row(
          children: [
            Text(
              "4.	Reporting-",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2),
            ),
            Text(
              "Your reporting will be to the MD of the Company. This may however change",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        Wrap(
          children: [
            Text(
              "depending on the Organizational growth and/ or requirement.",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),

        // leaves
        Row(
          children: [
            Text(
              "5.	Leaves -",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2),
            ),
            Text(
              "You will not be entitled to any leave (either privileged or sick or casual). If you are",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        Wrap(
          children: [
            Text(
              "however required to take any leave due to any Medical/Personal Emergency during this period it will be treated as Leave without Pay (LWP). You will be entitled to leaves as per the Company Policy and governing rules & regulations which will be informed to you on joining.",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
      ],
    );
  }

  static page2(logoImage, ttf_arial) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // logo and address
        PdfWidgets.header(logoImage: logoImage, ttf_arial: ttf_arial),
        SizedBox(height: 10),
        //date of joining
        Row(
          children: [
            Text(
              "6.	Company Holidays -",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2),
            ),
            Text(
              "A List of Company Holidays is declared at the start of a Calendar Year ",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        Wrap(
          children: [
            Text(
              "and Circulated to the Employees. The same will be shared with you on joining.",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),

        // Place of work
        Wrap(
          children: [
            Row(
              children: [
                Text(
                  "7.	Company Rules & Regulations -",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2),
                ),
                Text(
                  "You will need to abide by the rules and regulations laid ",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        Wrap(
          children: [
            Text(
              "down by the Company during your service. A rules and regulations handbook/ document will be provided to / shared with you on joining.",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),

        // working hours
        Row(
          children: [
            Text(
              "8.	Confidentiality -",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2),
            ),
            Text(
              "You will maintain utmost confidentiality about the Company's Business ",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        Wrap(
          children: [
            Text(
              "affairs/ transaction such as, but not limited to, Clientele, revenue, documentation, Any Company/ Client specific sensitive information, Trademarks, Patents etc. You will also not disclose/ discuss your Salary or any other Company Confidential information in your knowledge with any of your Colleagues/ Outsiders. The Company may get a Non- Disclosure Agreement (NDA) and/or an Invention Protection Clause signed by you once you join the Company.",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),

        // Reporting
        Row(
          children: [
            Text(
              "9.	Salary& Incentives -",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2),
            ),
            Text(
              "You will be paid a Salary of INR 1, 80, 000(Indian Rupees One ",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        Wrap(
          children: [
            Text(
              "Lakh Eighty Thousand Only) Per Annum subject to deduction of applicable taxes.",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),

        // leaves
        Row(
          children: [
            Text(
              "10.	Work Ethics and Code of Conduct -",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2),
            ),
            Text(
              "The Company expects highest standards of work ethics ",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        Wrap(
          children: [
            Text(
              "and a moral conduct which is in line with socially and legally accepted norms. The Management will have low tolerance on the following type of conduct (this list is illustrative and not exhaustive. The exhaustive list will be in Company's Employee Manual):",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),

        // sub text
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "a. ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Accepting any present, commission or any sort of gratification in cash or kind from",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Text(
                  "any person, party or firm or a corporate having dealings with the Company.",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 10),

                //
                Row(
                  children: [
                    Text(
                      "b. ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Absence from duty without the approval of Manager or any other superior authority.",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Any other conduct considered deterrent to Company's interest or of violation in terms of letter.",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 10),

                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "c. ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Non- Disclosure/ Concealment of Material Facts or furnishing of misleading information ",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "on the basis of which the Company makes an Offer of Employment.",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),

                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "d. ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Publishing of Articles, communicating with the Press, Delivering Lectures pertaining to",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "any Company Matters without the Express Permission of the Management.",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),

                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "e. ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Mental/ Sexual harassment of any fellow employee/ colleague/ sub-ordinate.",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),

        //
        Row(
          children: [
            Text(
              "11. Safekeeping of Company's Assets -",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2),
            ),
            Text(
              "It will be the duty of the Employee for Safekeeping",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        Wrap(
          children: [
            Text(
              "any Company Assets in his/her possession and ensure safe return of such Assets to the Company whenever required.",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),

        //
        Text(
          "Kindly acknowledge a Copy of this Letter in acceptance along with the following set of",
          style: TextStyle(fontSize: 12),
        ),
        Text(
          "documents:",
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  static page3(logoImage, ttf_arial, stamp, sign, ttf_times) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // logo and address
        PdfWidgets.header(logoImage: logoImage, ttf_arial: ttf_arial),
        SizedBox(height: 20),

        // body
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'a. ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '2 Latest Passport Size Photographs.',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                //

                Row(
                  children: [
                    Text(
                      'b. ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Permanent Address Proof (Passport/ Electricity Bill/ Telephone Bill/ Aadhar Card Copy)',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                //

                Row(
                  children: [
                    Text(
                      'c. ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'PAN Card Copy.',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                //

                Row(
                  children: [
                    Text(
                      'd. ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Graduation/ Post Graduation Degree Certificates.',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                //

                Row(
                  children: [
                    Text(
                      'e. ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Relieving Letters of all Previous Employers (for latest\nEmployer an acceptance of resignation proof will be sufficient)',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                //

                Row(
                  children: [
                    Text(
                      'f. ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "Latest Salary Slip/ Revision Letter of Previous Employer.",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                //
              ],
            ),
          ],
        ),
        SizedBox(height: 10),

        //
        Text(
          "You may Scan the above documents and send them in a Zip file by E-mail (send to the same\nmail id from which the Offer has been sent).",
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        SizedBox(height: 10),

        //
        Text(
          "We look forward to your being on board with us very soon and have a long and mutually\nrewarding professional association with the Company.",
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        SizedBox(height: 10),

        // stamp and sign
        PdfWidgets.row(ttf_times: ttf_times, sign: sign, stamp: stamp)
      ],
    );
  }
}
