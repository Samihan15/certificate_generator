import 'package:certificate_generator/screens/expenses_details.dart';
import 'package:certificate_generator/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  var firestoreDb =
      FirebaseFirestore.instance.collection('Expenses').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orange,
        title: Text('Expenses'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreDb,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final doc = snapshot.data!.docs;
            return ListView.builder(
              itemCount: doc.length,
              itemBuilder: (BuildContext context, int index) {
                var total = doc[index]['office_rent'] +
                    doc[index]['trainer'] +
                    doc[index]['wifi'] +
                    doc[index]['water'] +
                    doc[index]['light_bill'] +
                    doc[index]['mobile_bill'] +
                    doc[index]['other'] +
                    doc[index]['office_cleaning'];

                return Card(
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          doc[index]['month'],
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10),
                      // table
                      Table(
                        border:
                            TableBorder.all(width: 1.0, color: Colors.black),
                        children: [
                          TableRow(
                            children: [
                              Text(
                                'Bills',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Amount',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // office rent
                          TableRow(
                            children: [
                              Text(
                                'office rent',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${doc[index]['office_rent']}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // trainer
                          TableRow(
                            children: [
                              Text(
                                'trainer',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${doc[index]['trainer']}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // light bill
                          TableRow(
                            children: [
                              Text(
                                'light bill',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${doc[index]['light_bill']}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // mobile bill
                          TableRow(
                            children: [
                              Text(
                                'mobile bill',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${doc[index]['mobile_bill']}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // wifi bill
                          TableRow(
                            children: [
                              Text(
                                'wifi bill',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${doc[index]['wifi']}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // water bill
                          TableRow(
                            children: [
                              Text(
                                'water bill',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${doc[index]['water']}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // office cleaning
                          TableRow(
                            children: [
                              Text(
                                'office cleaning',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${doc[index]['office_cleaning']}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // other
                          TableRow(
                            children: [
                              Text(
                                'other',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${doc[index]['other']}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // total
                          TableRow(
                            children: [
                              Text(
                                'total',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${total}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                'Empty',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Expenses_Details()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
