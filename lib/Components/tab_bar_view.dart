import 'package:equbapp/Components/money_collected_grid.dart';
import 'package:equbapp/Controllers/collected_money_controllers.dart';
import 'package:flutter/material.dart';
import 'package:equbapp/Components/constants.dart';
import 'package:get/get.dart';

class TabBarPage extends StatefulWidget {
  @override
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with TickerProviderStateMixin {
  late TabController tabcontroller;
  @override
  void initState() {
    super.initState();
    tabcontroller = new TabController(length: 2, vsync: this);
  }

  void handaletabsection() {
    setState(() {});
  }

  final CollectedMoneyProvider collectedMoneyProvider =
      Get.put(CollectedMoneyProvider());
  @override
  Widget build(BuildContext context) {
    return collectedMoneyProvider.isloading.value
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: EdgeInsets.only(top: 30),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  TabBar(
                    controller: tabcontroller,
                    indicatorColor: Colors.white,
                    unselectedLabelColor: bgcolor2,
                    labelColor: Colors.white,
                    labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                    tabs: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.6,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color:
                              tabcontroller.index == 0 ? bgcolor : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          border: Border.all(
                              color: bgcolor2,
                              style: BorderStyle.solid,
                              width: 1.5),
                        ),
                        child: Tab(
                          child: Text(
                            "Money Collected",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.6,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color:
                              tabcontroller.index == 1 ? bgcolor : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          border: Border.all(
                              color: bgcolor2,
                              style: BorderStyle.solid,
                              width: 1.5),
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
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: TabBarView(
                        controller: tabcontroller,
                        children: <Widget>[
                          MoneyCollectedGrid(),
                          MoneyCollectedGrid()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
