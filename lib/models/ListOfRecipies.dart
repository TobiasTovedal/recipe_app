import 'package:recipe_app/models/Recipe.dart';

class ListOfRecipies {
  List<Recipe> list = [];

  ListOfRecipies({List<Recipe> list}) {
    this.list = list ?? [];
  }

  //ListOfRecipies({this.list = const []});

  ListOfRecipies.fromJson(Map<String, dynamic> json)
      : list = (json['recipies'] as List)
            .map((jsonString) => Recipe.fromJson(jsonString))
            .toList();

  //map kan bara kallas på lista, om den kallas på null blir det knas
  Map<String, dynamic> toJson() =>
      {'recipies': list.map((recipe) => recipe.toJson()).toList()};

  void add(Recipe recipe) {
    this.list.add(recipe);
  }
}
