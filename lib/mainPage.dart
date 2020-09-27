import 'package:flutter/material.dart';
import 'package:recipe_app/addRecipePage.dart';
import 'package:recipe_app/recipePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class Recipe extends ChangeNotifier {
  String title, ingredient;
  //var ingredients = <String>[];
  //var instructions = <String>[];

  Recipe(this.title, this.ingredient);

  Recipe.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        ingredient = json['ingredient'];

  Map<String, dynamic> toJson() => {'title': title, 'ingredient': ingredient};

  Future<void> setJson(String _title, String _ingredient) async {
    title = _title;
    ingredient = _ingredient;

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('recipeJson', jsonEncode(this));
    notifyListeners();
  }

  Future<void> loadJson() async {
    final prefs = await SharedPreferences.getInstance();
    String jsonString = prefs.getString('recipeJson');
    Map recipeMap = jsonDecode(jsonString);

    title = Recipe.fromJson(recipeMap).title;
    ingredient = Recipe.fromJson(recipeMap).ingredient;

    print(jsonString);
    notifyListeners();
  }
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

    Provider.of<Recipe>(context, listen: false).loadJson();

    return myScaffold;
  }
}
