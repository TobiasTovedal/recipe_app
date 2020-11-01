import 'package:flutter/material.dart';
import 'package:recipe_app/addRecipePage.dart';
import 'package:recipe_app/models/Recipe.dart';
import 'package:recipe_app/models/Recipies.dart';
import 'package:recipe_app/storage/storage.dart' as storage;
import 'package:flutter/foundation.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Recipies recipies = new Recipies();

  @override
  void initState() {
    super.initState();
    loadRecipeData();
  }

  void loadRecipeData() async {
    recipies = await storage.loadListOfRecipies();
    setState(() {});
  }

  void saveRecipeData(recipies) async {
    await storage.saveListOfRecipies(recipies);
  }

  void moreOnPressed() {
    print('more pressed');
  }

  void recipeTapped(index) {
    Navigator.pushNamed(context, '/recipePage',
        arguments: recipies.list[index]);
  }

  void _navigateAndAddRecipe(BuildContext context) async {
    final Recipe recipe = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddRecipePage()));

    setState(() {
      recipies.list.add(recipe);
      saveRecipeData(recipies);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget recipeList = ListView.separated(
        padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(recipies.list[index].title),
            child: ListTile(
                title: Text('${recipies.list[index].title}'),
                subtitle: Text('${recipies.list[index].ingredient}'),
                onTap: () => recipeTapped(index),
                leading: ClipOval(
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.lightGreen[50],
                    child: Icon(Icons.description),
                  ),
                )),
            onDismissed: (direction) {
              setState(() {
                Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("${recipies.list[index].title} dismissed")));
                recipies.list.removeAt(index);
                storage.saveListOfRecipies(recipies);
              });
            },
            background: Container(
                color: Colors.red,
                alignment: Alignment.center,
                child: ListTile(
                  leading: Icon(Icons.delete_forever),
                  trailing: Icon(Icons.delete_forever),
                )),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(indent: 20, endIndent: 20, height: 1),
        itemCount: recipies.list.length);

    Widget myScaffold = Scaffold(
        appBar: AppBar(
          title: Text('Recipeee app'),
          actions: [
            IconButton(
              icon: Icon(Icons.create),
              onPressed: () {
                _navigateAndAddRecipe(context);
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
