import 'package:certificate_generator/screens/account_list.dart';
import 'package:certificate_generator/screens/employee_list.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Lightorange,
        title: Text('Dashboard'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              children: [
                // Employee list button
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentListScreen()));
                    },
                    child: Container(
                      width: double.infinity,
                      color: white,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/student.jpg',
                            fit: BoxFit.fill,
                            height: 170,
                            width: 150,
                          ),
                          Text(
                            'List of Employee',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Add employee button
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountList()));
                    },
                    child: Container(
                      width: double.infinity,
                      color: white,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/employee.jpg',
                            fit: BoxFit.contain,
                            height: 250,
                            width: 150,
                          ),
                          Text(
                            'Accounts',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
