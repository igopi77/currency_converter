// To parse this JSON data, do
//
//     final ratesModel = ratesModelFromJson(jsonString);

import 'dart:convert';

RatesModel ratesModelFromJson(String str) => RatesModel.fromJson(json.decode(str));

String ratesModelToJson(RatesModel data) => json.encode(data.toJson());

class RatesModel {
  bool error;
  int status;
  String message;
  String description;

  RatesModel({
    required this.error,
    required this.status,
    required this.message,
    required this.description,
  });

  factory RatesModel.fromJson(Map<String, dynamic> json) => RatesModel(
    error: json["error"],
    status: json["status"],
    message: json["message"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "status": status,
    "message": message,
    "description": description,
  };
}
