import 'package:deli_meals/dummy_data.dart';
import 'package:deli_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryTitle = args['title'] ?? '';
    final categoryID = args['id'];
    final categoryMeals = DUMMY_MEALS
        .where(
          (element) => element.categories.contains(categoryID),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Meal meal = categoryMeals[index];
          return MealItem(
              title: meal.title,
              imageUrl: meal.imageUrl,
              duration: meal.duration,
              complexity: meal.complexity,
              affordability: meal.affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
