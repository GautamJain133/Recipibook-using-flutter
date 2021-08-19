import 'package:flutter/material.dart';
import 'package:recipibook/dummyData.dart';

import 'Categories_meals_screen.dart';

class CategoriesItems extends StatelessWidget {
  final String title;
  final Color kolor;
  final String id;

  CategoriesItems(this.title, this.kolor,this.id);

  void selectCategories(BuildContext context) {
    //Navigator.of(context).push(
   //   MaterialPageRoute(
      //  builder: (_) {
      //    return CategoryMealScreen(CategoryId: id,CategoryTitle: title,);
       // },
     // ),
    //);


    Navigator.of(context).pushNamed(/*"/categories-meals"*/ CategoryMealScreen.routeName,arguments:{
      "id":id,"title":title,
    } );

    }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategories(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [kolor.withOpacity(0.7), kolor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
