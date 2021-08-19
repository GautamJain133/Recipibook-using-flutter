import 'package:flutter/material.dart';
import 'package:recipibook/meals_items.dart';
import 'meals.dart';
import 'dummyData.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/categories-meals';
  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routeargs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final CategoryTitle = routeargs['title'];
    final CategoryId = routeargs['id'];
    final categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(CategoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(CategoryTitle),

      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            affordability: categoryMeals[index].affordability,
            imageurl: categoryMeals[index].imageUrl,
            complexity: categoryMeals[index].complexity,
            title: categoryMeals[index].title,
            duration: categoryMeals[index].duration,
            id: categoryMeals[index].id,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
