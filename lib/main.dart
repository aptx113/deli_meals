import 'package:flutter/material.dart';

import '../screens/categories_screen.dart';
import '../screens/category_meals_screen.dart';
import '../screens/meal_detail_screen.dart';
import '../screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(secondary: Colors.amber)),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
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
