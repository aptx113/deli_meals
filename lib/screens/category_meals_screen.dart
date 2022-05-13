import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  const CategoryMealsScreen({Key? key, required this.availableMeals})
      : super(key: key);

  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;

  var _loadInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;

      categoryTitle = args['title'] ?? '';
      final categoryID = args['id'];
      displayedMeals = widget.availableMeals
          .where(
            (element) => element.categories.contains(categoryID),
          )
          .toList();
      _loadInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Meal meal = displayedMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
