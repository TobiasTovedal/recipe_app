class Recipe {
  String title, ingredient;
  //var ingredients = <String>[];
  //var instructions = <String>[];

  Recipe({this.title, this.ingredient});

  Recipe.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        ingredient = json['ingredient'];

  Map<String, dynamic> toJson() => {'title': title, 'ingredient': ingredient};

/*   Future<void> setJson(String _title, String _ingredient) async {
    title = _title;
    ingredient = _ingredient;

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('recipeJson', jsonEncode(this));
    notifyListeners();
  }

  Future<void> loadJson() async {
    final prefs = await SharedPreferences.getInstance();
    String jsonString = prefs.getString('recipeJson');
    Map recipeMap = jsonDecode(jsonString);

    title = Recipe.fromJson(recipeMap).title;
    ingredient = Recipe.fromJson(recipeMap).ingredient;

    print(jsonString);
    notifyListeners();
  } */
}
