import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SettingsState();
  }
}

class SettingsState extends State<Settings> {
  bool switchValue = true;
  bool checkboxValue = true;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextStyle categoryStyle =
        themeData.textTheme.body2.copyWith(color: themeData.accentColor);

    final TextStyle dialogTextStyle = themeData.textTheme.subhead
        .copyWith(color: themeData.textTheme.caption.color);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Settings'),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new Text(
              'Category 1',
              style: categoryStyle,
            ),
          ),
          new ListTile(
            title: new Text('Settings Item 1'),
            subtitle: new Text('This is a ListTile'),
            onTap: () {
              showDialog(
                context: context,
                child: new AlertDialog(
                  content: new Text('Settings item clicked.',
                      style: dialogTextStyle),
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () {
                        Navigator.pop(context, 'OK');
                      },
                      child: const Text('OK'),
                    )
                  ],
                ),
              );
            },
          ),
          new Divider(height: 1.0),
          new ListTile(
            title: new Text('Settings Item 2'),
            subtitle: new Text('This is a ListTile'),
            onTap: () {
              showDialog(
                context: context,
                child: new AlertDialog(
                  content: new Text('Settings item clicked.',
                      style: dialogTextStyle),
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () {
                        Navigator.pop(context, 'OK');
                      },
                      child: const Text('OK'),
                    )
                  ],
                ),
              );
            },
          ),
          new Divider(height: 1.0),
          new ListTile(
            title: new Text('Settings Item 3'),
            subtitle: new Text('This is a ListTile'),
            onTap: () {
              showDialog(
                context: context,
                child: new AlertDialog(
                  content: new Text('Settings item clicked.',
                      style: dialogTextStyle),
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () {
                        Navigator.pop(context, 'OK');
                      },
                      child: const Text('OK'),
                    )
                  ],
                ),
              );
            },
          ),
          new ListTile(
            title: new Text(
              'Category 2',
              style: categoryStyle,
            ),
          ),
          new CheckboxListTile(
            value: checkboxValue,
            onChanged: (bool value) {
              setState(() {
                checkboxValue = value;
              });
            },
            title: new Text('Checkbox Item'),
            subtitle: new Text('This is a CheckboxListTile'),
          ),
          new Divider(height: 1.0),
          new SwitchListTile(
            value: switchValue,
            onChanged: (bool value) {
              setState(() {
                switchValue = value;
              });
            },
            title: new Text('Switch Item'),
            subtitle: new Text('This is a SwitchListTile'),
          ),
        ],
      ),
    );
  }
}
