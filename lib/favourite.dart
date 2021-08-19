import 'package:flutter/material.dart';

import 'meals.dart';
import 'meals_items.dart';

class FavouriteScreen extends StatefulWidget {
  final List<Meal>_favourite;

  FavouriteScreen(this._favourite);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget._favourite.isEmpty) {
      return Center(

        child: Text("No Favourites yet please add some"),
      );
    }
    else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            affordability: widget._favourite[index].affordability,
            imageurl: widget._favourite[index].imageUrl,
            complexity: widget._favourite[index].complexity,
            title: widget._favourite[index].title,
            duration: widget._favourite[index].duration,
            id: widget._favourite[index].id,
          );
        },
        itemCount: widget._favourite.length,
      );
    }
  }
}
