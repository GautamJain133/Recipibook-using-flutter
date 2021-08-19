import 'package:flutter/material.dart';
import 'Categories_meals_screen.dart';
import 'dummyData.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";
  final Function togglefavourite;
  final Function isfavourite;
  MealDetailScreen(this.togglefavourite,this.isfavourite);

  Widget buildsectiontile(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(context).textTheme.headline6),
    );
  }

  Widget buildcontainer(Widget child, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.85,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;
    final selectedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedmeal.title.toString()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: Image.asset(
                  selectedmeal.imageUrl,
                  fit: BoxFit.cover,
                )),
            buildsectiontile(context, "Ingredients"),
            buildcontainer(
                ListView.builder(
                  itemBuilder: (context, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(selectedmeal.ingredients[index]),
                    ),
                  ),
                  itemCount: selectedmeal.ingredients.length,
                ),
                context),
            buildsectiontile(context, "Steps"),
            buildcontainer(
                ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children:[ ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(selectedmeal.steps[index]),
                    ),
                      Divider()


                    ],


                  ),

                  itemCount: selectedmeal.steps.length,
                ),
                context)
          ],
        ),



      ),

      floatingActionButton: FloatingActionButton(

        child:Icon(
          isfavourite(mealid)?Icons.star:Icons.star_border
        ),
        onPressed:()=>togglefavourite(mealid),

      ),
    );
  }
}
