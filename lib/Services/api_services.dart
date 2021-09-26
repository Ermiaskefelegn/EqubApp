import 'dart:developer';
import 'package:equbapp/Components/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:equbapp/Models/collected_money_models.dart';
import 'package:equbapp/Models/due_paymnet_models.dart';

class ApiServices {
  static Future<List<DuePaymnetModel>> getduepaymnetData() async {
    List<DuePaymnetModel> allduedata = [];
    try {
      var url =
          Uri.parse("https://610e396448beae001747ba80.mockapi.io/duePayments");

      var client = http.Client();
      final response = await client.get(url);
      if (response.statusCode == 200) {
        allduedata = duePaymnetModelFromJson(response.body);
        return allduedata;
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
      print(Exception);
      return <DuePaymnetModel>[];
    }
    return allduedata;
  }

  static Future<List<CollectedMoneyModel>> getcollectedmoneyData() async {
    List<CollectedMoneyModel> allcollecteddata = [];
    try {
      var url = Uri.parse(
          "https://610e396448beae001747ba80.mockapi.io/collectedPayments");
      var client = http.Client();
      final response = await client.get(url);
      if (response.statusCode == 200) {
        allcollecteddata = collectedMoneyModelFromJson(response.body);
        return allcollecteddata;
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
      print(Exception);
      return <CollectedMoneyModel>[];
    }

    return allcollecteddata;
  }
}
