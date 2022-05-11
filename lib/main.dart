import 'package:flutter/material.dart';

import '../screens/categories_screen.dart';
import '../screens/category_meals_screen.dart';
import '../screens/filters_screen.dart';
import '../screens/meal_detail_screen.dart';
import '../screens/tabs_screen.dart';
import 'dummy_data.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeData theme = ThemeData(
    primarySwatch: Colors.pink,
    canvasColor: Color.fromRGBO(255, 254, 229, 1),
    fontFamily: 'Raleway',
    textTheme: ThemeData.light().textTheme.copyWith(
        bodyText1: TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1),
        ),
        bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
        headline6: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold)),
  );

  List<Meal> _availableMeals = DUMMY_MEALS;
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree)
          return false;
        else if (_filters['lactose'] == true && !meal.isLactoseFree)
          return false;
        else if (_filters['vegan'] == true && !meal.isVegan)
          return false;
        else if (_filters['vegatarian'] == true && !meal.isVegetarian)
          return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(secondary: Colors.amber)),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(
              currentFilter: _filters,
              saveFilters: _setFilters,
            )
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return null;
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: ((context) => CategoriesScreen())),
    );
  }
}
