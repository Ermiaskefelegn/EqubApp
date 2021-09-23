import 'package:equbapp/Components/constants.dart';
import 'package:equbapp/Components/grid_component_widget.dart';
import 'package:flutter/material.dart';

class MoneyCollectedGrid extends StatefulWidget {
  const MoneyCollectedGrid({Key? key}) : super(key: key);

  @override
  _MoneyCollectedGridState createState() => _MoneyCollectedGridState();
}

class _MoneyCollectedGridState extends State<MoneyCollectedGrid> {
  List<int> items = List<int>.generate(10, (int index) => index);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPaddin / 1.5, vertical: kDefaultPaddin),
        child: GridView.builder(
          itemCount: items.length,
          padding: EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: kDefaultPaddin,
            crossAxisSpacing: kDefaultPaddin,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (BuildContext context, int index) {
            // var catagoryList = snapshot.data!.catagory[index];
            return GridComponentWidget(press: () {});
          },
        ));
  }
}
