import 'package:equbapp/Components/constants.dart';
import 'package:equbapp/Components/money_collected.dart';
import 'package:equbapp/Components/money_due.dart';
import 'package:flutter/material.dart';

class TabBarView extends StatefulWidget {
  const TabBarView({Key? key}) : super(key: key);

  @override
  _TabBarViewState createState() => _TabBarViewState();
}

class _TabBarViewState extends State<TabBarView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicatorColor: bgcolor,
            unselectedLabelColor: Color(0xFF555555),
            labelColor: bgcolor2,
            labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
            tabs: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  border: Border.all(
                      color: bgcolor, style: BorderStyle.solid, width: 2.5),
                ),
                child: Tab(
                  child: Text(
                    "Money Collected",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  border: Border.all(
                      color: bgcolor, style: BorderStyle.solid, width: 2.5),
                ),
                child: Tab(
                  child: Text(
                    "Money Due",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                children: [MoneyCollected(), MoneyDue()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}