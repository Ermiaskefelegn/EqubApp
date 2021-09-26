import 'package:equbapp/Models/due_paymnet_models.dart';
import 'package:equbapp/Services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DuePaymnetProvider extends GetxController {
  var getdata = <DuePaymnetModel>[].obs;
  var isloading = true.obs;
  bool loading = false;

  @override
  void onInit() {
    getDuePaymentData();
    super.onInit();
  }

  getDuePaymentData() async {
    isloading(true);

    try {
      var paymnetdata = await ApiServices.getduepaymnetData();
      // ignore: unnecessary_null_comparison
      if (paymnetdata != null) {
        getdata.value = paymnetdata;
        print(paymnetdata);
      }
    } finally {
      isloading(false);
    }
  }
}
