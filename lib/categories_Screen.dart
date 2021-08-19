import 'package:flutter/material.dart';
import 'package:recipibook/dummyData.dart';
import 'categories_items.dart';


class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        children: Dummy_categories.map((cate){
          return CategoriesItems(cate.title, cate.color,cate.id);
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),

    );
  }
}
