import 'package:equbapp/Controllers/collected_money_controllers.dart';
import 'package:equbapp/Controllers/due_paymnet_controllers.dart';
import 'package:equbapp/Screens/equb_home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(MultiProvider(providers: providers, child: MyApp()));
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<DuePaymnetProvider>(
      create: (_) => DuePaymnetProvider()),
  ChangeNotifierProvider<CollectedMoneyProvider>(
      create: (_) => CollectedMoneyProvider()),
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EqubHomePage(),
    );
  }
}
