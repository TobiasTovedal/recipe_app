import 'package:flutter/material.dart';
import 'package:recipe_app/addRecipePage.dart';
import 'package:recipe_app/recipePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Recipe extends ChangeNotifier {
  String title;
  //var ingredients = <String>[];
  //var instructions = <String>[];

  Recipe(this.title);

  void setTitle(String s) {
    title = s;
    notifyListeners();
  }

  Recipe.fromJson(Map<String, dynamic> json) : title = json['title'];

  Map<String, dynamic> toJson() => {'title': title};
}

class MainPage extends StatelessWidget {
  final List entries = [
    'Köttbullar',
    'Pad Thai',
    'Grönsakssoppa',
  ];

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

    return myScaffold;
  }
}
