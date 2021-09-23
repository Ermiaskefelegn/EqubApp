import 'dart:convert';

List<DuePaymnetModel> welcomeFromJson(String str) => List<DuePaymnetModel>.from(
    json.decode(str).map((x) => DuePaymnetModel.fromJson(x)));

String welcomeToJson(List<DuePaymnetModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DuePaymnetModel {
  DuePaymnetModel({
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
