import 'package:equbapp/Models/collected_money_models.dart';
import 'package:equbapp/Services/api_services.dart';
import 'package:flutter/material.dart';

class CollectedMoneyProvider with ChangeNotifier {
  late CollectedMoneyModel getdata;
  late DateTime createdAt;
  late String owedAmount;
  late DateTime dueDate;
  late String name;
  late int paidRounds;
  late int totalRounds;
  late String id;
  bool loading = false;

  getPostData(context) async {
    getdata = CollectedMoneyModel(
        createdAt: createdAt,
        owedAmount: owedAmount,
        dueDate: dueDate,
        name: name,
        paidRounds: paidRounds,
        totalRounds: totalRounds,
        id: id);
    loading = true;
    getdata = await ApiServices().getcollectedmoneyData(context);
    loading = false;

    notifyListeners();
  }
}
