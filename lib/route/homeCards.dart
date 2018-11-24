import 'package:flutter/material.dart';

class HomeCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          new Card(
            color: Color(0xFFFFF59D),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text('This Is A Title'),
                  subtitle: const Text('This is a subtitle in a list tile.'),
                ),
                new ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: new ButtonBar(
                    children: <Widget>[
                      new FlatButton(
                        child: const Text('Button1'),
                        onPressed: () {},
                      ),
                      new FlatButton(
                        child: const Text('Button2'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Image.asset(
                  'res/images/material_design_2.jpg',
//                  height: 192.0,
                  fit: BoxFit.fill,
                ),
                const ListTile(
                  title: const Text('This Is A Title'),
                  subtitle: const Text('This is a subtitle in a card.'),
                ),
                new ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: new ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new FlatButton(
                        child: const Text('Button1'),
                        onPressed: () {},
                      ),
                      new FlatButton(
                        child: const Text('Button2'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: <Widget>[
                    new Image.asset(
                      'res/images/material_design_4.jpg',
//                      height: 192.0,
                      fit: BoxFit.fill,
                    ),
                    new ListTile(
                      title: new Text(
                        'This Is A Title',
                        style:
                            new TextStyle(color: Colors.white, fontSize: 24.0),
                      ),
                    ),
                  ],
                ),
                new ButtonTheme.bar(
                  child: new ButtonBar(
                    alignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(Icons.favorite, color: Colors.grey),
                        onPressed: () {},
                      ),
                      new IconButton(
                        icon: new Icon(Icons.bookmark, color: Colors.grey),
                        onPressed: () {},
                      ),
                      new IconButton(
                        icon: new Icon(Icons.share, color: Colors.grey),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ].map((Widget widget) {
          // Add a little space between the widgets
          return new Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: widget,
          );
        }).toList(),
      ),
    );
  }
}
