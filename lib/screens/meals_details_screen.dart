import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import '../models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meals-details';
  Meal mealData;
  void getMealData(String mealId) {
    mealData = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String id = routeArgs['id'];
    getMealData(id);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Details'),
      ),
      body: Center(
        child: Text('Meals ${mealData.title} Details goes here'),
      ),
    );
  }
}
