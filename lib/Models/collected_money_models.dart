// To parse this JSON data, do
//
//     final collectedMoneyModel = collectedMoneyModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

List<CollectedMoneyModel> collectedMoneyModelFromJson(String str) =>
    List<CollectedMoneyModel>.from(
        json.decode(str).map((x) => CollectedMoneyModel.fromJson(x)));

String collectedMoneyModelToJson(List<CollectedMoneyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CollectedMoneyModel {
  CollectedMoneyModel(
      {this.createdAt,
      this.title,
      this.frequency,
      this.amount,
      this.membersCount,
      this.id,
      required this.issaved});

  final createdAt;
  final title;
  final frequency;
  final amount;
  final membersCount;
  final id;
  RxBool issaved;

  factory CollectedMoneyModel.fromJson(Map<String, dynamic> json) =>
      CollectedMoneyModel(
          createdAt: DateTime.parse(json["createdAt"]),
          title: json["title"],
          frequency: json["frequency"],
          amount: json["amount"],
          membersCount: json["membersCount"],
          id: json["id"],
          issaved: false.obs);

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "title": title,
        "frequency": frequency,
        "amount": amount,
        "membersCount": membersCount,
        "id": id,
      };
}
