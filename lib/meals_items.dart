import 'package:flutter/material.dart';
import 'package:recipibook/mealdetails.dart';
import 'meals.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageurl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String id;


  MealItem(
      {
        @required this.id,
        @required this.affordability,
      @required this.imageurl,
      @required this.complexity,
      @required this.title,
      @required this.duration});
  String get ComplexityText{
    if(complexity==Complexity.Simple)
      {
        return "Simple";
      }
    if(complexity==Complexity.Challenging)
    {
      return "Challenging";
    }
    if(complexity==Complexity.Hard)
    {
      return "Hard";
    }
  }
  String get AffordabilityText{
    if(affordability==Affordability.Affordable)
    {
      return "Affordable";
    }
    if(affordability==Affordability.Luxurious)
    {
      return "Luxurious";
    }
    if(affordability==Affordability.Pricey)
    {
      return "Pricey";
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName,arguments:id );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.asset(
                    imageurl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: 270,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text(duration.toString()+"   min"),

                    ],
                  ),Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(ComplexityText),

                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.monetization_on),
                      SizedBox(
                        width: 6,
                      ),
                      Text(AffordabilityText),

                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
