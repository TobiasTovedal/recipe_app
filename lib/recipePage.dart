import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Container _returnStep(String stringLabel, int stepNumber) {
      return Container(
        padding: const EdgeInsets.fromLTRB(0, 24, 0, 50),
        child: Row(
          children: [
            Icon(
              Icons.looks_one,
              color: Colors.green,
            ),
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
            'Köttbullar med potatismos',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('800 g köttfärs \n'
                  '2 dl grädde \n'
                  '1 dl ströbröd \n'
                  '4 st ägg'),
              _returnStep('Blanda allting i en stor bunke', 1)
            ],
          ),
        ),
        RaisedButton(
          child: Text('Back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );

    return Scaffold(
      body: myList,
    );
  }
}
