import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget Listtile(BuildContext context){
    return ListTile(
      leading: Icon(
        Icons.restaurant,
        size: 26,
      ),
      title: Text(
        "meals",
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.of(context).pushReplacementNamed('/');
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "coooking up!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            )),
        SizedBox(
          height: 20,
        ),
        Listtile(context),
        SizedBox(
          height: 20,
        ),

        ListTile(
          leading: Icon(
            Icons.settings,
            size: 26,
          ),
          title: Text(
            "Filters",
            style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {

            Navigator.of(context).pushReplacementNamed('/filters');

          },
        )
      ],
    ));
  }
}
