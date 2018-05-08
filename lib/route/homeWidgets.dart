import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomeWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeWidgetsState();
  }
}

class HomeWidgetsState extends State<HomeWidgets> {
  double _sliderValue_1 = 0.2;
  double _sliderValue_2 = 20.0;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextStyle categoryStyle =
        themeData.textTheme.body2.copyWith(color: themeData.primaryColor);
    final TextStyle accentColorText =
        themeData.textTheme.body1.copyWith(color: Colors.black54);

    return new ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: <Widget>[
        new Text('TextField', style: categoryStyle),
        new TextField(),
        new Text('Chips', style: categoryStyle),
        new Row(
          children: <Widget>[
            new Chip(label: new Text('Chip', style: accentColorText)),
            new Chip(
              avatar: new Icon(Icons.account_circle, color: Colors.black54),
              label: new Text('Chip', style: accentColorText),
            ),
            new Chip(
              deleteIcon:
                  new Icon(Icons.cancel, size: 18.0, color: Colors.black54),
              label: new Text('Chip', style: accentColorText),
              onDeleted: () {},
            ),
          ].map((Widget widget) {
            return new Container(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: widget,
            );
          }).toList(),
        ),
        new Text('ExpansionTile', style: categoryStyle),
        new ExpansionTile(
            title: const Text('Sublist'),
            backgroundColor: themeData.accentColor.withOpacity(0.025),
            children: const <Widget>[
              const ListTile(title: const Text('Item 1')),
              const ListTile(title: const Text('Item 2')),
              const ListTile(title: const Text('Item 3')),
            ]),
        new Text('Slider', style: categoryStyle),
        new Slider(
            value: _sliderValue_1,
            min: 0.0,
            max: 1.0,
            activeColor: themeData.accentColor,
            inactiveColor: Colors.black12,
            onChanged: (double value) {
              setState(() {
                _sliderValue_1 = value;
              });
            }),
        new Text('Slider with Divisions and Label', style: categoryStyle),
        new Slider(
            value: _sliderValue_2,
            min: 0.0,
            max: 100.0,
            activeColor: themeData.accentColor,
            inactiveColor: Colors.black12,
            divisions: 5,
            label: '${_sliderValue_2.round()}',
            onChanged: (double value) {
              setState(() {
                _sliderValue_2 = value;
              });
            }),
        new Text('LinearProgressIndicator', style: categoryStyle),
        new LinearProgressIndicator(
          backgroundColor: Colors.black12,
        ),
        new Text('CircularProgressIndicator', style: categoryStyle),
        new Stack(
          children: <Widget>[
            new CircularProgressIndicator(),
          ],
        ),
      ].map((Widget widget) {
        return new Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: widget,
        );
      }).toList(),
    );
  }
}
