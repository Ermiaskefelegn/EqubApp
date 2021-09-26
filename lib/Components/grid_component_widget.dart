import 'package:auto_size_text/auto_size_text.dart';
import 'package:equbapp/Components/constants.dart';
import 'package:equbapp/Controllers/collected_money_controllers.dart';
import 'package:equbapp/Models/collected_money_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridComponentWidget extends StatefulWidget {
  final Function press;
  final CollectedMoneyModel collectedMoneyModel;
  GridComponentWidget({
    Key? key,
    required this.press,
    required this.collectedMoneyModel,
  }) : super(key: key);

  @override
  _GridComponentWidgetState createState() => _GridComponentWidgetState();
}

class _GridComponentWidgetState extends State<GridComponentWidget> {
  @override
  void initState() {
    super.initState();
    frequencyChecker();
  }

  String frequencyIdentifier = "";
  void frequencyChecker() {
    if (widget.collectedMoneyModel.frequency % 3 == 0) {
      frequencyIdentifier = "Weekly";
      print(frequencyIdentifier);
    }
    if (widget.collectedMoneyModel.frequency % 2 == 0) {
      frequencyIdentifier = "Monthly";
      print(frequencyIdentifier);
    } else {
      frequencyIdentifier = "Annually";
      print(frequencyIdentifier);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool issaved = widget.collectedMoneyModel.issaved.value;
    return Stack(children: [
      Container(
          width: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
            border: Border.all(
              color: bgcolor2,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 3,
                leading: Image.asset("assets/logo.jpg"),
                title: AutoSizeText(
                  widget.collectedMoneyModel.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Icon(Icons.access_time_filled),
                    ),
                    Text(
                      frequencyIdentifier,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(Icons.group),
                    ),
                    Text(
                      "100 " + "Cycles",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(Icons.restore_rounded),
                    ),
                    Text(
                      "ETB " + "${widget.collectedMoneyModel.amount}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(Icons.monetization_on),
                    ),
                    Text(
                      "${widget.collectedMoneyModel.membersCount}" + " Members",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          )),
      Positioned(
          top: MediaQuery.of(context).size.height / 6.8,
          left: MediaQuery.of(context).size.width / 3,
          child: IconButton(
              onPressed: () {
                setState(() {
                  widget.press();
                  issaved = !issaved;
                  // if (issaved)
                });
                widget.press();
                Get.snackbar("Success", "Bookmarked {x} payment",
                    snackPosition: SnackPosition.BOTTOM,
                    colorText: bgcolor,
                    backgroundColor: bgcolor,
                    borderColor: bgcolor,
                    duration: Duration(seconds: 1),
                    animationDuration: Duration(seconds: 1),
                    borderRadius: 15,
                    borderWidth: 2.5);
              },
              icon: Icon(
                issaved ? Icons.bookmark_sharp : Icons.bookmark_border,
                size: 30,
              ))),
    ]);
  }
}
