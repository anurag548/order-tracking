// To parsrequired this JSON data, do
//
//     final DeliveryInfo = DeliveryInfoFromJson(jsonString);

import 'dart:convert';

DeliveryInfo DeliveryInfoFromJson(String str) =>
    DeliveryInfo.fromJson(json.decode(str));

String DeliveryInfoToJson(DeliveryInfo data) => json.encode(data.toJson());

class DeliveryInfo {
  DeliveryInfo({
    required this.message,
    required this.status,
    required this.statusCode,
    required this.data,
  });

  String message;
  String status;
  int statusCode;
  Map<String, List<Datum>> data;

  factory DeliveryInfo.fromJson(Map<String, dynamic> json) => DeliveryInfo(
        message: json["message"],
        status: json["status"],
        statusCode: json["status_code"],
        data: Map.from(json["data"]).map((k, v) =>
            MapEntry<String, List<Datum>>(
                k, List<Datum>.from(v.map((x) => Datum.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "status_code": statusCode,
        "data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(
            k, List<dynamic>.from(v.map((x) => x.toJson())))),
      };
}

class Datum {
  Datum({
    required this.statusCode,
    required this.statusText,
    required this.statusLocation,
    required this.statusTime,
  });

  String statusCode;
  String statusText;
  String statusLocation;
  String statusTime;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        statusCode: json["statusCode"],
        statusText: json["statusText"],
        statusLocation: json["statusLocation"],
        statusTime: json["statusTime"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "statusText": statusText,
        "statusLocation": statusLocation,
        "statusTime": statusTime,
      };
}
