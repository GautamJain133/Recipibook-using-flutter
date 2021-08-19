import 'package:flutter/material.dart';

import 'package:recipibook/Categories_meals_screen.dart';
import 'package:recipibook/dummyData.dart';
import 'package:recipibook/filters_Screen.dart';

import 'package:recipibook/mealdetails.dart';
import 'package:recipibook/meals.dart';

import 'package:recipibook/tabsscreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters={
    'gluten' :false,
    'lactose': false,
    'vegetarian':false,
  };
 List<Meal> _availableMeals =DUMMY_MEALS;
 List<Meal> _FavoutiteMeals = [];

 void _togglefavourite(String mealId){

  final existingindex= _FavoutiteMeals.indexWhere((meal) =>meal.id==mealId);



  if(existingindex>=0)
    {
      setState(() {
        _FavoutiteMeals.removeAt(existingindex);
      });
    }
  else{
    setState(() {
      _FavoutiteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    });
  }



 }




  void _setfilters(Map<String,bool>filterData)
  {
  setState(() {
    _filters=filterData;
    _availableMeals = DUMMY_MEALS.where((meals) {
      if(_filters['gluten' ] && !meals.isGlutenFree){
        return false;
      }
      if(_filters['lactose' ] && !meals.isLactoseFree){
        return false;
      }
      if(_filters['vegetarian'] && !meals.isVegetarian)
        {
          return false;
        }
      return true;


    }).toList();
  });



  }

  bool _isMealFavourite(String id)
  {
    return _FavoutiteMeals.any((meal) => meal.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          headline6: TextStyle(
            fontSize: 24,
            fontFamily: "RobotoCondensed",
            fontWeight: FontWeight.bold
          )
        ),
      ),
      //home: Categories(),
      initialRoute: '/',// default is '/'
      routes: {
        "/":(ctx)=> TabScreen (_FavoutiteMeals),
        "/filters":(ct)=>FilterScreen(_filters,_setfilters),

       // "/categories-meals":(context)=>CategoryMealScreen(),
        CategoryMealScreen.routeName:(context)=>CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName:(ctx)=>MealDetailScreen(_togglefavourite,_isMealFavourite),


      },


    );
  }

}
