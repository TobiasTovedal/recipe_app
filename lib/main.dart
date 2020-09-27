import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recipe_app/mainPage.dart';
import 'package:recipe_app/recipePage.dart';
import 'package:recipe_app/addRecipePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => Recipe(null, null), child: Root()));
}

class Root extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/recipePage': (context) => RecipePage(),
        '/addRecipePage': (context) => AddRecipePage()
      },
    );
  }
}
