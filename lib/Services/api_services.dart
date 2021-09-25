import 'dart:convert';
import 'dart:developer';
import 'package:equbapp/Components/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:equbapp/Models/collected_money_models.dart';
import 'package:equbapp/Models/due_paymnet_models.dart';

class ApiServices {
  Future<DuePaymnetModel> getduepaymnetData(context) async {
    late DuePaymnetModel result;
    var url = Uri.parse(
        "https://610e396448beae001747ba80.mockapi.io/collectedPayments");
    var client = http.Client();
    try {
      final response = await client.get(url);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = DuePaymnetModel.fromJson(item);
      } else {
        Get.snackbar("Error", "Data not found",
            snackPosition: SnackPosition.BOTTOM,
            colorText: bgcolor,
            backgroundColor: bgcolor2,
            borderColor: bgcolor,
            duration: Duration(seconds: 1),
            animationDuration: Duration(seconds: 2),
            borderRadius: 15,
            borderWidth: 2.5);
      }
    } catch (e) {
      log("e");
    }
    return result;
  }

  Future<CollectedMoneyModel> getcollectedmoneyData(context) async {
    late CollectedMoneyModel result;
    var url =
        Uri.parse("https://610e396448beae001747ba80.mockapi.io/duePayments");
    var client = http.Client();
    try {
      final response = await client.get(url);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = CollectedMoneyModel.fromJson(item);
      } else {
        Get.snackbar("Error", "Data not found",
            snackPosition: SnackPosition.BOTTOM,
            colorText: bgcolor,
            backgroundColor: bgcolor2,
            borderColor: bgcolor,
            duration: Duration(seconds: 1),
            animationDuration: Duration(seconds: 2),
            borderRadius: 15,
            borderWidth: 2.5);
      }
    } catch (e) {
      log("e");
    }
    return result;
  }
}
