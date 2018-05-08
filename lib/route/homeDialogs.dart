import 'package:flutter/material.dart';

class HomeDialogs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeDialogsState();
  }
}

class HomeDialogsState extends State<HomeDialogs> {
  TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    final DateTime now = new DateTime.now();
    _selectedTime = new TimeOfDay(hour: now.hour, minute: now.minute);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle =
        theme.textTheme.subhead.copyWith(color: theme.textTheme.caption.color);

    return new ListView(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      children: <Widget>[
        new RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 14.0),
            child: new Text(
              'Alert Dialog',
              style: new TextStyle(color: Colors.white),
            ),
            color: Colors.red,
            onPressed: () {
              showDialog(
                context: context,
                child: new AlertDialog(
                  content: new Text('This is content', style: dialogTextStyle),
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () {
                        Navigator.pop(context, 'OK');
                      },
                      child: const Text('OK'),
                    )
                  ],
                ),
              ).then((onValue) {
                if (onValue != null) {
                  Scaffold.of(context).showSnackBar(
                      new SnackBar(content: new Text('$onValue')));
                }
              });
            }),
        new RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 14.0),
            child: new Text(
              'Alert Dialog',
              style: new TextStyle(color: Colors.white),
            ),
            color: Colors.purple,
            onPressed: () {
              showDialog(
                context: context,
                child: new AlertDialog(
                  title: new Text('This Is Title'),
                  content: new Text('This is content', style: dialogTextStyle),
                  actions: <Widget>[
                    new FlatButton(
                        onPressed: () {
                          Navigator.pop(context, 'Cancel');
                        },
                        child: const Text('Cancel')),
                    new FlatButton(
                      onPressed: () {
                        Navigator.pop(context, 'OK');
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ).then((onValue) {
                if (onValue != null) {
                  Scaffold.of(context).showSnackBar(
                      new SnackBar(content: new Text('$onValue')));
                }
              });
            }),
        new RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 14.0),
            child: new Text(
              'Single Choice Dialog',
              style: new TextStyle(color: Colors.white),
            ),
            color: Colors.indigo,
            onPressed: () {
              showDialog(
                context: context,
                child: new SingleChoiceDialog(),
              ).then((onValue) {
                if (onValue != null) {
                  Scaffold.of(context).showSnackBar(
                      new SnackBar(content: new Text('$onValue')));
                }
              });
            }),
        new RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 14.0),
            child: new Text(
              'Multi Choise Dialog',
              style: new TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              showDialog(
                context: context,
                child: new MultiChoiceDialog(),
              ).then((onValue) {
                if (onValue != null) {
                  Scaffold.of(context).showSnackBar(
                      new SnackBar(content: new Text('$onValue')));
                }
              });
            }),
        new RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 14.0),
            child: new Text(
              'Time Picker Dialog',
              style: new TextStyle(color: Colors.white),
            ),
            color: Colors.teal,
            onPressed: () {
              showTimePicker(
                context: context,
                initialTime: _selectedTime,
              ).then((TimeOfDay value) {
                if (value != null) {
                  _selectedTime = value;
                  Scaffold.of(context).showSnackBar(new SnackBar(
                      content: new Text('${value.format(context)}')));
                }
              });
            }),
        new RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 14.0),
            child: new Text(
              'Date Picker Dialog',
              style: new TextStyle(color: Colors.white),
            ),
            color: Colors.green,
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: new DateTime.now(),
                firstDate: new DateTime(1970),
                lastDate: new DateTime(2500),
              ).then((DateTime value) {
                if (value != null) {
                  Scaffold.of(context).showSnackBar(
                      new SnackBar(content: new Text('${value}')));
                }
              });
            }),
        new RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 14.0),
            child: new Text(
              'Show modal Bottom Sheet',
              style: new TextStyle(color: Colors.white),
            ),
            color: Colors.orange,
            onPressed: () {
              showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return new Container(
                        padding: EdgeInsets.only(top: 16.0),
                        decoration: const BoxDecoration(
                          border: const Border(
                              top: const BorderSide(color: Colors.black12)),
                        ),
                        child: new ListView(
                          shrinkWrap: true,
                          primary: false,
                          children: <Widget>[
                            new ListTile(
                              dense: true,
                              title: const Text('This is a modal bottom sheet'),
                            ),
                            new ListTile(
                              dense: true,
                              title: const Text('Click anywhete to dismiss'),
                            ),
                            new ButtonTheme.bar(
                              // make buttons use the appropriate styles for cards
                              child: new ButtonBar(
                                children: <Widget>[
                                  new FlatButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ));
                  });
            }),
        new RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 14.0),
            child: new Text(
              'Show Bottom Sheet',
              style: new TextStyle(color: Colors.white),
            ),
            color: Colors.blueGrey,
            onPressed: () {
              showBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return new Container(
                        padding: EdgeInsets.only(top: 16.0),
                        decoration: const BoxDecoration(
                          border: const Border(
                              top: const BorderSide(color: Colors.black12)),
                        ),
                        child: new ListView(
                          shrinkWrap: true,
                          primary: false,
                          children: <Widget>[
                            new ListTile(
                              dense: true,
                              title: const Text('This is a bottom sheet'),
                            ),
                            new ListTile(
                              dense: true,
                              title: const Text('Click OK to dismiss'),
                            ),
                            new ButtonTheme.bar(
                              // make buttons use the appropriate styles for cards
                              child: new ButtonBar(
                                children: <Widget>[
                                  new FlatButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ));
                  });
            }),
      ].map((Widget widget) {
        return new Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: widget,
        );
      }).toList(),
    );
  }
}

int singleItemSelected = 0;
List<bool> checkboxSelected = <bool>[false, false, false, false];

class SingleChoiceDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SingleChoiceDialogState();
  }
}

class SingleChoiceDialogState extends State<SingleChoiceDialog> {
  @override
  Widget build(BuildContext context) {
    return new SimpleDialog(
      contentPadding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
      title: new Text('This Is Title'),
      children: <Widget>[
        new Column(
          children: <Widget>[
            new RadioListTile<int>(
              title: const Text('item 0'),
              value: 0,
              groupValue: singleItemSelected,
              onChanged: (int value) {
                setState(() {
                  singleItemSelected = value;
                });
                Navigator.pop(context, value);
              },
            ),
            new RadioListTile<int>(
              title: const Text('item 1'),
              value: 1,
              groupValue: singleItemSelected,
              onChanged: (int value) {
                setState(() {
                  singleItemSelected = value;
                });
                Navigator.pop(context, value);
              },
            ),
            new RadioListTile<int>(
              title: const Text('item 2'),
              value: 2,
              groupValue: singleItemSelected,
              onChanged: (int value) {
                setState(() {
                  singleItemSelected = value;
                });
                Navigator.pop(context, value);
              },
            ),
            new RadioListTile<int>(
              title: const Text('item 3'),
              value: 3,
              groupValue: singleItemSelected,
              onChanged: (int value) {
                setState(() {
                  singleItemSelected = value;
                });
                Navigator.pop(context, value);
              },
            ),
          ],
        ),
        new ButtonTheme.bar(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: new ButtonBar(
            children: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(context, 'Cancel');
                  },
                  child: const Text('Cancel')),
            ],
          ),
        ),
      ],
    );
  }
}

class MultiChoiceDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MultiChoiceDialogState();
  }
}

class MultiChoiceDialogState extends State<MultiChoiceDialog> {
  @override
  Widget build(BuildContext context) {
    return new SimpleDialog(
      contentPadding: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 0.0),
      title: new Text('This Is Title'),
      children: <Widget>[
        new Column(
          children: <Widget>[
            new CheckboxListTile(
              title: const Text('item 0'),
              value: checkboxSelected[0],
              onChanged: (bool value) {
                setState(() {
                  checkboxSelected[0] = value;
                });
              },
            ),
            new CheckboxListTile(
                title: const Text('item 1'),
                value: checkboxSelected[1],
                onChanged: (bool value) {
                  setState(() {
                    checkboxSelected[1] = value;
                  });
                }),
            new CheckboxListTile(
                title: const Text('item 2'),
                value: checkboxSelected[2],
                onChanged: (bool value) {
                  setState(() {
                    checkboxSelected[2] = value;
                  });
                }),
            new CheckboxListTile(
                title: const Text('item 3'),
                value: checkboxSelected[3],
                onChanged: (bool value) {
                  setState(() {
                    checkboxSelected[3] = value;
                  });
                }),
          ],
        ),
        new ButtonTheme.bar(
          child: new ButtonBar(
            children: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(context, 'OK');
                  },
                  child: const Text('OK')),
            ],
          ),
        ),
      ],
    );
  }
}
