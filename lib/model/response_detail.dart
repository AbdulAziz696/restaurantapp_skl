import 'dart:convert';

import 'dart:core';

ResponseDetail responseDetailFromJson(String string) =>
    ResponseDetail.fromJson(json.decode(string));

String responseDetailToJson(ResponseDetail data) => json.encode(data.toJson());

class ResponseDetail {
  List<Map<String?, String>> meals;

  ResponseDetail({required this.meals});

  factory ResponseDetail.fromJson(Map<String, dynamic> json) => ResponseDetail(
        meals: List<Map<String, String>>.from(json["meals"].map((e) =>
            Map.from(e).map((key, value) =>
                MapEntry<String, String>(key, value)))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((e) => Map.from(e).map(
            (key, value) =>
                MapEntry<String, dynamic>(key, value))))
      };
}
