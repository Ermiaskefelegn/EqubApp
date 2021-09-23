import 'dart:convert';

List<CollectedMoneyModel> collectedMoneyModelFromJson(String str) =>
    List<CollectedMoneyModel>.from(
        json.decode(str).map((x) => CollectedMoneyModel.fromJson(x)));

String collectedMoneyModelToJson(List<CollectedMoneyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CollectedMoneyModel {
  CollectedMoneyModel({
    required this.createdAt,
    required this.owedAmount,
    required this.dueDate,
    required this.name,
    required this.paidRounds,
    required this.totalRounds,
    required this.id,
  });

  DateTime createdAt;
  String owedAmount;
  DateTime dueDate;
  String name;
  int paidRounds;
  int totalRounds;
  String id;

  factory CollectedMoneyModel.fromJson(Map<String, dynamic> json) =>
      CollectedMoneyModel(
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
