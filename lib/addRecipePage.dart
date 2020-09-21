import 'package:flutter/material.dart';

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
          title: Text('Add page'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print(titleController.text);
            Navigator.pop(context);
          },
          child: Icon(Icons.check),
        ),
        body: formList);
  }
}
