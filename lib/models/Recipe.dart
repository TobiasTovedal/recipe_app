class Recipe {
  String title, ingredient;
  //var ingredients = <String>[];
  //var instructions = <String>[];

  Recipe({this.title, this.ingredient});

  Recipe.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        ingredient = json['ingredient'];

  Map<String, dynamic> toJson() => {'title': title, 'ingredient': ingredient};
}
