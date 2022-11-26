import 'package:certificate_generator/utils/constants.dart';
import 'package:certificate_generator/widget/custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Expenses_Details extends StatefulWidget {
  const Expenses_Details({Key? key}) : super(key: key);

  @override
  State<Expenses_Details> createState() => _Expenses_DetailsState();
}

class _Expenses_DetailsState extends State<Expenses_Details> {
  TextEditingController _officeRent = TextEditingController();
  TextEditingController _trainer = TextEditingController();
  TextEditingController _lightbill = TextEditingController();
  TextEditingController _mobilebill = TextEditingController();
  TextEditingController _wifibill = TextEditingController();
  TextEditingController _waterbill = TextEditingController();
  TextEditingController _officeCleaning = TextEditingController();
  TextEditingController _other = TextEditingController();
  TextEditingController _month = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _officeRent.dispose();
    _trainer.dispose();
    _lightbill.dispose();
    _mobilebill.dispose();
    _wifibill.dispose();
    _waterbill.dispose();
    _officeCleaning.dispose();
    _other.dispose();
    _month.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orange,
        title: Text('Add Expenses'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 10),
              textfield(
                controller: _month,
                label: 'Add Month and Year,Ex. May,2022',
              ),
              SizedBox(height: 10),
              textfield(
                  controller: _officeRent,
                  label: 'Office Rent',
                  type: TextInputType.number),
              SizedBox(height: 10),
              textfield(
                  controller: _trainer,
                  label: 'Trainer',
                  type: TextInputType.number),
              SizedBox(height: 10),
              textfield(
                  controller: _lightbill,
                  label: 'Light Bill',
                  type: TextInputType.number),
              SizedBox(height: 10),
              textfield(
                  controller: _mobilebill,
                  label: 'Mobile Bill',
                  type: TextInputType.number),
              SizedBox(height: 10),
              textfield(
                  controller: _wifibill,
                  label: 'Wifi Bill',
                  type: TextInputType.number),
              SizedBox(height: 10),
              textfield(
                  controller: _waterbill,
                  label: 'Water Bill',
                  type: TextInputType.number),
              SizedBox(height: 10),
              textfield(
                  controller: _officeCleaning,
                  label: 'Office Cleaning',
                  type: TextInputType.number),
              SizedBox(height: 10),
              textfield(
                  controller: _other,
                  label: 'Other',
                  type: TextInputType.number),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      expenses(
                          office_rent: _officeRent.text,
                          tariner: _trainer.text,
                          light_bill: _lightbill.text,
                          mobile_bill: _mobilebill.text,
                          wifi: _wifibill.text,
                          water: _waterbill.text,
                          office_cleaning: _officeCleaning.text,
                          other: _other.text,
                          month: _month.text.trim());

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
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future expenses(
      {var office_rent,
      var tariner,
      var light_bill,
      var mobile_bill,
      var wifi,
      var water,
      var office_cleaning,
      var other,
      String? month}) async {
    final expense = FirebaseFirestore.instance.collection('Expenses').doc();

    final json = {
      'office_rent': int.parse(office_rent),
      'trainer': int.parse(tariner),
      'light_bill': int.parse(light_bill),
      'mobile_bill': int.parse(mobile_bill),
      'wifi': int.parse(wifi),
      'water': int.parse(water),
      'office_cleaning': int.parse(office_cleaning),
      'other': int.parse(other),
      'month': month,
    };
    await expense.set(json);
  }
}
