import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:recipe_app/addRecipePage.dart';
import 'package:recipe_app/recipePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List entries = [
    'Köttbullar',
    'Pad Thai',
    'Grönsakssoppa',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget recipeList = ListView.separated(
        padding: EdgeInsets.all(8),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RecipePage()));
            },
            child: Container(
              height: 50,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${entries[index]}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: entries.length);

    Widget myScaffold = Scaffold(
        appBar: AppBar(
          title: Text('Recipeee app'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddRecipePage()));
              },
            )
          ],
        ),
        body: recipeList);

    Provider.of<Recipe>(context, listen: false).loadJson();

    return myScaffold;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
