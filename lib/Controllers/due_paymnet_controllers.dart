import 'package:equbapp/Models/due_paymnet_models.dart';
import 'package:equbapp/Services/api_services.dart';
import 'package:flutter/material.dart';

class DuePaymnetProvider with ChangeNotifier {
  late DuePaymnetModel getdata;
  late DateTime createdAt;
  late String owedAmount;
  late DateTime dueDate;
  late String name;
  late int paidRounds;
  late int totalRounds;
  late String id;

  bool loading = false;

  getPostData(context) async {
    getdata = DuePaymnetModel(
        createdAt: createdAt,
        owedAmount: owedAmount,
        dueDate: dueDate,
        name: name,
        paidRounds: paidRounds,
        totalRounds: totalRounds,
        id: id);
    loading = true;
    getdata = await ApiServices().getduepaymnetData(context);
    loading = false;

    notifyListeners();
  }
}
