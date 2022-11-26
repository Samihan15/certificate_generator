import 'package:certificate_generator/screens/accounts_details.dart';
import 'package:certificate_generator/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AccountsExp extends StatefulWidget {
  const AccountsExp({Key? key}) : super(key: key);

  @override
  State<AccountsExp> createState() => _AccountsExpState();
}

class _AccountsExpState extends State<AccountsExp> {
  var firestoreDb =
      FirebaseFirestore.instance.collection('Accounts').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: orange,
          title: Text('Accounts'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: firestoreDb,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final doc = snapshot.data!.docs;
              return ListView.builder(
                itemCount: doc.length,
                itemBuilder: (BuildContext context, int index) {
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Amount',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            // total business
                            TableRow(
                              children: [
                                Text(
                                  'total business',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${doc[index]['total_business']}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            // total collection
                            TableRow(
                              children: [
                                Text(
                                  'total collection',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${doc[index]['total_collection']}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            // total_pending_collection
                            TableRow(
                              children: [
                                Text(
                                  'total pending collection',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${doc[index]['total_pending_collection']}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

                            // total
                            TableRow(
                              children: [
                                Text(
                                  'total',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "{total}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
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
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ));
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AccountsDetails()));
          },
          child: Icon(Icons.add),
        ));
  }
}
