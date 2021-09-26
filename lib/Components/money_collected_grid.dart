import 'package:equbapp/Components/constants.dart';
import 'package:equbapp/Components/grid_component_widget.dart';
import 'package:equbapp/Controllers/collected_money_controllers.dart';
import 'package:equbapp/Controllers/save_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoneyCollectedGrid extends StatefulWidget {
  MoneyCollectedGrid({
    Key? key,
  }) : super(key: key);

  @override
  _MoneyCollectedGridState createState() => _MoneyCollectedGridState();
}

class _MoneyCollectedGridState extends State<MoneyCollectedGrid> {
  SaveMoneyCollectedData saveMoneyCollectedData =
      Get.put(SaveMoneyCollectedData());
  final CollectedMoneyProvider collectedMoneyProvider =
      Get.put(CollectedMoneyProvider());
  List<int> items = List<int>.generate(10, (int index) => index);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: kDefaultPaddin),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: collectedMoneyProvider.getdata.length,
          padding: EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: kDefaultPaddin,
            crossAxisSpacing: kDefaultPaddin / 2,
            childAspectRatio: 0.98,
          ),
          itemBuilder: (BuildContext context, int index) {
            var dataList = collectedMoneyProvider.getdata[index];
            return GridComponentWidget(
              collectedMoneyModel: dataList,
              press: () {
                if (dataList.issaved.value == false) {
                  saveMoneyCollectedData.addItem(
                      dataList.createdAt,
                      dataList.title,
                      dataList.frequency,
                      dataList.amount,
                      dataList.membersCount,
                      dataList.id,
                      dataList.issaved);
                }
              },
            );
          },
        ));
  }
}
