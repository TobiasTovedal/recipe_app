import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/mainPage.dart';

class AddRecipePage extends StatelessWidget {
  Widget build(BuildContext context) {
    final titleController = TextEditingController();

    Widget formList = ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TextFormField(
          decoration: const InputDecoration(
              icon: Icon(Icons.title),
              hintText: 'Name of your recipe',
              labelText: 'Title'),
          controller: titleController,
        )
      ],
    );

    return Scaffold(
        appBar: AppBar(
          title: Consumer<Recipe>(builder: (context, recipe, child) {
            print(recipe.title);
            return Text('${recipe.title}');
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //print(titleController.text);
            Provider.of<Recipe>(context, listen: false)
                .setTitle(titleController.text);
            Navigator.pop(context);
          },
          child: Icon(Icons.check),
        ),
        body: formList);
  }
}
