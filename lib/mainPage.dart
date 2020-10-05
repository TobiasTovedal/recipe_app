import 'package:flutter/material.dart';
import 'package:recipe_app/addRecipePage.dart';
import 'package:recipe_app/models/Recipies.dart';
import 'package:recipe_app/recipePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:recipe_app/storage/storage.dart' as storage;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Recipies recipies = new Recipies();
  final List entries = [
    'Köttbullar',
    'Pad Thai',
    'Grönsakssoppa',
  ];

  @override
  void initState() {
    super.initState();
    loadRecipeData();
  }

  void loadRecipeData() async {
    recipies = await storage.loadListOfRecipies();
    setState(() {});
    //print(recipies.list.map((recipe) => recipe.toString()));
  }

  @override
  Widget build(BuildContext context) {
    Widget recipeList = ListView.separated(
        padding: EdgeInsets.all(8),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/recipePage',
                  arguments: recipies.list[index]);
            },
            child: Container(
              height: 50,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Text(
                        '${recipies.list[index].title}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        '${recipies.list[index].ingredient}',
                        style: Theme.of(context).textTheme.headline6,
                      )
                    ],
                  )),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: recipies.list.length);

    Widget myScaffold = Scaffold(
        appBar: AppBar(
          title: Text('Recipeee app'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddRecipePage(
                              onReturnCallback: () => setState(() {}),
                            )));
              },
            )
          ],
        ),
        body: recipeList);

    return myScaffold;
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }
}
