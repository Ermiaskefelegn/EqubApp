import 'package:equbapp/Components/constants.dart';
import 'package:flutter/material.dart';

class DuePaymnet extends StatelessWidget {
  final Function press;
  const DuePaymnet({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: Container(
          decoration: BoxDecoration(
            color: bgcolor2,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Image.asset("assets/icons/logo.png"),
                backgroundColor: bgcolor2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Pay",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.monetization_on),
                    Text(
                      "ETB " + "2,000",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "3 " + "Days left",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(
                      // horizontal: kDefaultPaddin * 0.5,
                      vertical: kDefaultPaddin * 0.5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Pay",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          )),
    );
  }
}
