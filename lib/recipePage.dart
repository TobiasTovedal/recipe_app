import 'package:flutter/material.dart';
import 'package:recipe_app/models/Recipe.dart';

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Recipe recipe = ModalRoute.of(context).settings.arguments;

    Container step(String stringLabel, int stepNumber) {
      return Container(
        padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
        child: Row(
          children: [
            Container(
                padding: const EdgeInsets.only(left: 8),
                child: Text('$stepNumber. $stringLabel'))
          ],
        ),
      );
    }

    Widget myList = ListView(
      children: [
        Image.asset(
          'images/louis-hansel-shotsoflouis-mVZ_gjm_TOk-unsplash.jpg',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(12, 16, 8, 16),
          child: Text(
            recipe.title,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(recipe.ingredient), step('', 1), step('', 2)],
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text('Recept page')),
      body: myList,
    );
  }
}
