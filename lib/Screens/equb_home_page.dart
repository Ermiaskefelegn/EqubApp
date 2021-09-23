import 'package:equbapp/Components/circular_chart_component.dart';
import 'package:equbapp/Components/constants.dart';
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
            builder: (con) => CircleAvatar(
                  backgroundColor: Colors.purple[900],
                  child: IconButton(
                    icon: Icon(Icons.account_circle, color: bgcolor2),
                    onPressed: () => Scaffold.of(con).openDrawer(),
                  ),
                )),
        actions: <Widget>[
          IconButton(
            icon: Icon(CupertinoIcons.bookmark, color: bgcolor),
            onPressed: () {},
          ),
          SizedBox(width: kDefaultPaddin / 2)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [CircularChart()],
            )
          ],
        ),
      ),
    );
  }
}
