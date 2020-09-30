import 'package:recipe_app/models/Recipe.dart';
import 'package:recipe_app/models/Recipies.dart';
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

saveListOfRecipies(Recipies recipesList) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('recipes', json.encode(recipesList.toJson()));
}

loadListOfRecipies() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('recipes')) {
    return Recipies.fromJson(json.decode(prefs.getString('recipes')));
  }
  return Recipies();
}

clear() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
  print('Shared preferences cleared');
}
