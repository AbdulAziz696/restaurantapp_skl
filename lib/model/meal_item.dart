import 'dart:convert';

import 'package:flutter/material.dart';

class Meal {
  Meal({
    required this.idMeal,
    required this.strMeal,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strCategory,
  });

  String? idMeal;
  String? strMeal;
  String? strInstructions;
  String? strMealThumb;
  String? strCategory;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        idMeal: json["idMeal"],
        strMeal: json["strMeal"],
        strInstructions: json["strInstructions"],
        strMealThumb: json["strMealThumb"],
        strCategory: json["strCategory"],
      );

  Map<String, dynamic> toJson() => {
        "idMeal": idMeal,
        "strMeal": strMeal,
        "strInstructions": strInstructions,
        "strMealThumb": strMealThumb,
        "strCategory": strCategory,
      };

  void setFavoriteId(String id) {
    idMeal = id;
  }
}
