import 'package:flutter/material.dart';
import 'package:recipibook/categories_Screen.dart';
import 'package:recipibook/drawer.dart';
import 'package:recipibook/favourite.dart';

import 'meals.dart';

class TabScreen extends StatefulWidget {

  final List<Meal> _favouritescreen;

  TabScreen(this._favouritescreen);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
 List<Map<String, Object>> _Pages;

 void initState(){
   _Pages = [
   {
   "page": CategoriesScreen(),
   "title": "Categories",
   },
   {
   "page": FavouriteScreen(widget._favouritescreen),
   "title": "Favourite",
   },
   ];
 }
  int _selectedpageindex = 0;

  void _selectpage(int index) {
    setState(() {
      _selectedpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    /*(length: 2, child: Scaffold(
      appBar: AppBar(
        title:Text("Meals"),
    bottom: TabBar(tabs: [
          Tab(icon: Icon(Icons.category),text: "Categories",),
      Tab(icon: Icon(Icons.star),text: "Favourite",)
    ],)
    ),

    body: TabBarView(children: [
      CategoriesScreen(),
      FavouriteScreen()
    ],),
    ) );*/

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_Pages[_selectedpageindex]['title']),
            Text(
              "Developed by gautam",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      drawer: MainDrawer(),
      body: _Pages[_selectedpageindex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedpageindex,
        type: BottomNavigationBarType.shifting,
        items: [
          // ignore: deprecated_member_use
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label:"Categories"),

          // ignore: deprecated_member_use
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourite",
          ),
        ],
      ),
    );
  }
}
