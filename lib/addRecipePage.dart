import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/mainPage.dart';

class AddRecipePage extends StatelessWidget {
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
        appBar: AppBar(
          title: Consumer<Recipe>(builder: (context, recipe, child) {
            print(recipe.title);
            print(recipe.ingredient);
            return Text('${recipe.title} + ${recipe.ingredient}');
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //print(titleController.text);
            Navigator.pop(context);
            Provider.of<Recipe>(context, listen: false)
                .setTitle(titleController.text);
            Provider.of<Recipe>(context, listen: false)
                .setIngredient(ingredientController.text);
          },
          child: Icon(Icons.check),
        ),
        body: formList);
  }
}
