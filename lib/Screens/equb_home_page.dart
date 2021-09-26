import 'package:equbapp/Components/circular_chart_component.dart';
import 'package:equbapp/Components/constants.dart';
import 'package:equbapp/Components/due_paymnet_carusel.dart';
import 'package:equbapp/Components/tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EqubHomePage extends StatefulWidget {
  const EqubHomePage({Key? key}) : super(key: key);

  @override
  _EqubHomePageState createState() => _EqubHomePageState();
}

class _EqubHomePageState extends State<EqubHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: bgcolor2,
        toolbarHeight: MediaQuery.of(context).size.height / 14,
        elevation: 0,
        centerTitle: true,
        leading: Builder(
            builder: (con) => Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.purple[900],
                    child: Icon(Icons.account_circle, color: bgcolor2),
                  ),
                )),
        actions: <Widget>[
          IconButton(
            icon: Icon(CupertinoIcons.bookmark, color: Colors.grey),
            onPressed: () {},
          ),
          SizedBox(width: kDefaultPaddin / 2)
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: true,
          children: [CircularChart(), DuePaymnetCarusel(), TabBarPage()],
        ),
      ),
    );
  }
}
