import 'package:equbapp/Components/constants.dart';
import 'package:equbapp/Models/due_paymnet_models.dart';
import 'package:flutter/material.dart';

class DuePaymnet extends StatefulWidget {
  final Function press;
  final DuePaymnetModel duePaymnetModel;

  const DuePaymnet({
    Key? key,
    required this.press,
    required this.duePaymnetModel,
  }) : super(key: key);

  @override
  _DuePaymnetState createState() => _DuePaymnetState();
}

class _DuePaymnetState extends State<DuePaymnet> {
  int dateCalculate(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(from.year, from.month, from.day);
    return (to.difference(from).inHours / 24).round();
  }

  @override
  Widget build(BuildContext context) {
    final initialdate = DateTime(widget.duePaymnetModel.dueDate);
    final currentdate = DateTime.now();
    final difffrence = dateCalculate(currentdate, initialdate);
    return GestureDetector(
      onTap: () {
        widget.press();
      },
      child: Container(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
            border: Border.all(
              color: bgcolor2,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width / 9,
                child: Icon(
                  Icons.monetization_on_outlined,
                  color: bgcolor,
                  size: 45,
                ),
                backgroundColor: bgcolor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  widget.duePaymnetModel.name.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.monetization_on),
                    Text(
                      "ETB " + "${widget.duePaymnetModel.dueDate}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.monetization_on,
                      color: Colors.grey,
                    ),
                    Text(
                      "$difffrence" + "Days left",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 2.8,
                  margin: EdgeInsets.symmetric(vertical: kDefaultPaddin * 0.3),
                  padding: EdgeInsets.symmetric(vertical: kDefaultPaddin * 0.3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: Text(
                    "Pay",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          )),
    );
  }
}
