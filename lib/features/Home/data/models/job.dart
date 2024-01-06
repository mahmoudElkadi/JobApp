
import 'dart:convert';

List<JopModel> jopModelFromJson(String str) => List<JopModel>.from(json.decode(str).map((x) => JopModel.fromJson(x)));

String jopModelToJson(List<JopModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JopModel {
  final String id;
  final String title;
  final String location;
  final String description;
  final String company;
  final String salary;
  final String period;
  final String contract;
  final String requirements;
  final String agentId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  JopModel({
    required this.id,
    required this.title,
    required this.location,
    required this.description,
    required this.company,
    required this.salary,
    required this.period,
    required this.contract,
    required this.requirements,
    required this.agentId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory JopModel.fromJson(Map<String, dynamic> json) => JopModel(
    id: json["_id"],
    title: json["title"],
    location: json["location"],
    description: json["description"],
    company: json["company"],
    salary: json["salary"],
    period: json["period"],
    contract: json["contract"],
    requirements: json["requirements"],
    agentId: json["agentId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "location": location,
    "description": description,
    "company": company,
    "salary": salary,
    "period": period,
    "contract": contract,
    "requirements": requirements,
    "agentId": agentId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
