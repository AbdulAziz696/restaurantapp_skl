import 'package:flutter/material.dart';
import 'package:restaurantapp_skl/model/response_filter.dart';
import 'package:restaurantapp_skl/ui/item_meals.dart';

import '../page/detail_page.dart';

Widget? listMeals(ResponseFilter? responseFilter) {
  if (responseFilter == null) {
    return null;
  }
  return ListView.builder(
      itemCount: responseFilter.meals!.length,
      itemBuilder: (BuildContext context, int index) {
        var itemMeal = responseFilter.meals?[index];

        return InkWell(
          splashColor: Colors.lightBlue,
          child: itemMeals(
            itemMeal?.idMeal,
            itemMeal?.strMeal,
            itemMeal?.strMealThumb,
          ),
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                DetailPage(idMeal: itemMeal?.idMeal ?? "")
                ));
          },
        );
      });
}
