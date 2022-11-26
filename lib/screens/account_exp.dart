import 'package:certificate_generator/screens/accounts_details.dart';
import 'package:certificate_generator/utils/constants.dart';
import 'package:flutter/material.dart';

class AccountsExp extends StatefulWidget {
  const AccountsExp({Key? key}) : super(key: key);

  @override
  State<AccountsExp> createState() => _AccountsExpState();
}

class _AccountsExpState extends State<AccountsExp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: orange,
          title: Text('Accounts'),
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
