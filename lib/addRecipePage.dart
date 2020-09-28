import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/mainPage.dart';
import 'package:recipe_app/models/Recipe.dart';
import 'package:recipe_app/storage/storage.dart' as storage;

class AddRecipePage extends StatefulWidget {
  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  Recipe recipe;

  @override
  void initState() {
    loadRecipeData();
    super.initState();
  }

  void loadRecipeData() async {
    recipe = await storage.loadRecipe();
  }

  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final ingredientController = TextEditingController();

    Widget formList = ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TextFormField(
          decoration: const InputDecoration(
              icon: Icon(Icons.title),
              hintText: 'Name of your recipe',
              labelText: 'Title'),
          controller: titleController,
        ),
        TextFormField(
          decoration: const InputDecoration(
              icon: Icon(Icons.plus_one),
              hintText: 'Give an ingredient',
              labelText: 'Ingredient'),
          controller: ingredientController,
        )
      ],
    );

    return Scaffold(
        appBar: AppBar(title: Text('Texxt')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            recipe.title = titleController.text;
            recipe.ingredient = ingredientController.text;
            storage.saveRecipe(recipe);
            Navigator.pop(context);
          },
          child: Icon(Icons.check),
        ),
        body: formList);
  }
}
