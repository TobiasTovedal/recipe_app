import 'package:flutter/material.dart';

class AddRecipePage extends StatelessWidget {
  Widget build(BuildContext context) {
    Widget formList = ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TextFormField(
          decoration: const InputDecoration(
              icon: Icon(Icons.title),
              hintText: 'Name of your recipe',
              labelText: 'Title'),
        )
      ],
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Add page'),
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Hoppa bakåt
              },
            )
          ],
        ),
        body: formList);
  }
}
