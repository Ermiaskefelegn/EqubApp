import 'package:equbapp/Models/collected_money_models.dart';
import 'package:equbapp/Services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectedMoneyProvider extends GetxController {
  var getdata = <CollectedMoneyModel>[].obs;
  var isloading = true.obs;
  @override
  void onInit() {
    getCollectedMoneyData();
    super.onInit();
  }

  getCollectedMoneyData() async {
    isloading(true);
    try {
      var collectedata = await ApiServices.getcollectedmoneyData();
      // ignore: unnecessary_null_comparison
      if (collectedata != null) {
        getdata.value = collectedata;
        print(collectedata);
      }
    } finally {
      isloading(false);
    }
  }
}
