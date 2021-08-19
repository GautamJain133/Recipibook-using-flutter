import 'package:flutter/material.dart';
import 'package:recipibook/drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routename = '/filters';
  final Function savefilters;
  final Map<String,bool> currFilters;
  FilterScreen(this.currFilters,this.savefilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _lactoseFree = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFree=widget.currFilters['gluten'];
    _lactoseFree=widget.currFilters['lactose'];
    _vegetarian=widget.currFilters['vegetarian'];


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
          actions: [
            IconButton(icon: Icon( Icons.save), onPressed:(){
              final selectedfilters={
                'gluten' :_glutenFree,
                'lactose': _lactoseFree,
                'vegetarian':_vegetarian,
              };


              widget.savefilters(selectedfilters);})
          ],

        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text("Adjust your meal selection",

                style: Theme
                    .of(context)
                    .textTheme
                    .headline6,
              ),
            ),
            Expanded(child: ListView(

              children: [
                SwitchListTile(title: Text("Glutene_free"),
                  value: _glutenFree,
                  subtitle: Text("only include glutenfree"),
                  onChanged: (newvalue) {
                    setState(() {
                      _glutenFree = newvalue;
                    });

                  },),
                SwitchListTile(
                  title: Text("Lactose_free"),
                  value: _lactoseFree,
                  subtitle: Text("only include laxtosefree"),
                  onChanged: (newvalue) {
                    setState(() {
                      _lactoseFree = newvalue;
                    });
                  },), SwitchListTile(
                  title: Text("vegitarian"),
                  value: _vegetarian,
                  subtitle: Text("only include vegitarian"),
                  onChanged: (newvalue) {
                    setState(() {
                      _vegetarian = newvalue;
                    });
                  },),
              ],
            ))

          ],
        )
    );
  }
}
