// To parse this JSON data, do
//
//     final duePaymnetModel = duePaymnetModelFromJson(jsonString);

import 'dart:convert';

List<DuePaymnetModel> duePaymnetModelFromJson(String str) =>
    List<DuePaymnetModel>.from(
        json.decode(str).map((x) => DuePaymnetModel.fromJson(x)));

String duePaymnetModelToJson(List<DuePaymnetModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DuePaymnetModel {
  DuePaymnetModel({
    this.createdAt,
    this.owedAmount,
    this.dueDate,
    this.name,
    this.paidRounds,
    this.totalRounds,
    this.id,
  });

  final createdAt;
  final owedAmount;
  final dueDate;
  final name;
  final paidRounds;
  final totalRounds;
  final id;

  factory DuePaymnetModel.fromJson(Map<String, dynamic> json) =>
      DuePaymnetModel(
        createdAt: DateTime.parse(json["createdAt"]),
        owedAmount: json["owedAmount"],
        dueDate: DateTime.parse(json["dueDate"]),
        name: json["name"],
        paidRounds: json["paidRounds"],
        totalRounds: json["totalRounds"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "owedAmount": owedAmount,
        "dueDate": dueDate.toIso8601String(),
        "name": name,
        "paidRounds": paidRounds,
        "totalRounds": totalRounds,
        "id": id,
      };
}
