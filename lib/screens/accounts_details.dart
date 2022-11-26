import 'package:certificate_generator/utils/constants.dart';
import 'package:certificate_generator/widget/custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AccountsDetails extends StatefulWidget {
  const AccountsDetails({Key? key}) : super(key: key);

  @override
  State<AccountsDetails> createState() => _AccountsDetailsState();
}

class _AccountsDetailsState extends State<AccountsDetails> {
  TextEditingController _month = TextEditingController();
  TextEditingController total_business = TextEditingController();
  TextEditingController total_collection = TextEditingController();
  TextEditingController total_pending_collection = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _month.dispose();
    total_business.dispose();
    total_collection.dispose();
    total_pending_collection.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accounts Details'),
        backgroundColor: orange,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 10),
              textfield(controller: _month, label: 'Month and Year'),
              SizedBox(height: 10),
              textfield(
                  controller: total_business,
                  label: 'Total Business',
                  type: TextInputType.number),
              SizedBox(height: 10),
              textfield(
                  controller: total_collection,
                  label: 'Total Collection',
                  type: TextInputType.number),
              SizedBox(height: 10),
              textfield(
                  controller: total_pending_collection,
                  label: 'Total Pending Collection',
                  type: TextInputType.number),
              SizedBox(height: 10),
              Container(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    accounts(
                      total_business: total_business.text,
                      total_collection: total_collection.text,
                      total_pending_collection: total_pending_collection.text,
                      month: _month.text.trim(),
                    );

                    const snackdemo = SnackBar(
                      content: Text(
                        'Data Successfully Added !',
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: Colors.yellowAccent,
                      elevation: 10,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.all(5),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackdemo);
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future accounts(
      {var total_business,
      var total_collection,
      var total_pending_collection,
      String? month}) async {
    final expense = FirebaseFirestore.instance.collection('Accounts').doc();

    final json = {
      'total_business': int.parse(total_business),
      'total_collection': int.parse(total_collection),
      'total_pending_collection': int.parse(total_pending_collection),
      'month': month.toString(),
    };
    await expense.set(json);
  }
}
