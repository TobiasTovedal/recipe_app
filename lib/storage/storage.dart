import 'package:recipe_app/models/Recipe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

saveRecipe(Recipe recipe) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('recipe', json.encode(recipe.toJson()));
}

loadRecipe() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('recipe')) {
    return Recipe.fromJson(json.decode(prefs.getString('recipe')));
  }
  return Recipe();
}
