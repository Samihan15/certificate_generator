import 'package:certificate_generator/screens/account.dart';
import 'package:certificate_generator/screens/account_exp.dart';
import 'package:certificate_generator/screens/expenses.dart';
import 'package:certificate_generator/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class AccountList extends StatefulWidget {
  const AccountList({Key? key}) : super(key: key);

  @override
  State<AccountList> createState() => _AccountListState();
}

class _AccountListState extends State<AccountList> {
  TextEditingController _search = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _search.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Lightorange,
        title: Text('Employee list'),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            // search bar
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _search,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  labelText: 'search',
                  hintText: 'search employee',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
            ),
            // list of students
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 65,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Account()));
                      },
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name : ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.close_menu,
        backgroundColor: Colors.amber,
        overlayColor: Colors.yellow,
        overlayOpacity: 0.4,
        children: [
          SpeedDialChild(
              child: Icon(Icons.money_rounded),
              label: 'Expenses',
              backgroundColor: Colors.green,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Expenses()));
              }),
          SpeedDialChild(
              child: Icon(Icons.account_balance_wallet),
              label: 'Accounts',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountsExp()));
              },
              backgroundColor: Colors.deepOrangeAccent),
          SpeedDialChild(
            child: Icon(Icons.money_rounded),
            label: 'Expenses',
          )
        ],
      ),
    );
  }
}
