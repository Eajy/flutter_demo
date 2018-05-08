import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/tabWidget.dart';
import 'package:flutter_demo/route/homeCards.dart';
import 'package:flutter_demo/route/homeDialogs.dart';
import 'homeWidgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['Cards', 'Dialogs', 'Widgets'];

    final List<Widget> widgets = <Widget>[
      new HomeCards(),
      new HomeDialogs(),
      new HomeWidgets(),
    ];

    const List<Menu> menus = const <Menu>[
      const Menu(title: 'item 1', icon: Icons.add),
      const Menu(title: 'item 2', icon: Icons.add),
      const Menu(title: 'item 3', icon: Icons.add),
    ];

    return new TabbedScaffold(
      title: 'Flutter Demo',
      tabs: tabs,
      actions: <Widget>[
        new IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          tooltip: 'more',
          onPressed: () {},
        ),
        new PopupMenuButton<Menu>(
          itemBuilder: (BuildContext context) {
            return menus.skip(0).map((Menu menu) {
              return new PopupMenuItem<Menu>(
                value: menu,
                child: new Text(menu.title),
              );
            }).toList();
          },
        ),
      ],
      widgets: widgets,
    );
  }
}

class Menu {
  const Menu({this.title, this.icon});

  final String title;
  final IconData icon;
}
