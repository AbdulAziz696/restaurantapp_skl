import 'package:flutter/material.dart';
import 'package:restaurantapp_skl/database/dbhelper.dart';
import 'package:restaurantapp_skl/model/response_filter.dart';
import 'package:restaurantapp_skl/ui/list_meals.dart';

class FavouritePage extends StatefulWidget {
  final int indexNav;

  const FavouritePage({Key? key, required this.indexNav}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  int currentIndex = 0;
  String category = "Seafood";
  ResponseFilter? responseFilter;
  bool isLoading = true;
  var db = DBHelper();

  void fectDataMeals() async {
    var data = await db.gets(category);
    setState(() {
      responseFilter = ResponseFilter(meals: data);
      isLoading = false;
    });
  }
  @override
  void iniState(){
    super.initState();
    fectDataMeals();
    currentIndex= widget.indexNav;

  }
  @override
  Widget build(BuildContext context) {
    var listNav = [
      listMeals(responseFilter),
      listMeals(responseFilter),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Recipe'),
        backgroundColor: Colors.amber,
      ),

      body: Center(
        child: isLoading == false
            ? listNav[currentIndex]
            : CircularProgressIndicator(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: 'Seafood'),
          BottomNavigationBarItem(icon: Icon(Icons.cake), label: 'Dessert'),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
            index == 0 ? category = "Seafood" : category = "Dessert";
          });
          fectDataMeals();
        },
      ),
    );
  }
}

