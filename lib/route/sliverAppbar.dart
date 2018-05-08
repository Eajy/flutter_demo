import 'package:flutter/material.dart';

class _ContactCategory extends StatelessWidget {
  const _ContactCategory({Key key, this.icon, this.children}) : super(key: key);

  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return new Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: new BoxDecoration(
          border: new Border(
              bottom: new BorderSide(color: themeData.dividerColor))),
      child: new DefaultTextStyle(
        style: Theme.of(context).textTheme.subhead,
        child: new SafeArea(
          top: false,
          bottom: false,
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  width: 72.0,
                  child: new Icon(icon, color: themeData.primaryColor)),
              new Expanded(child: new Column(children: children))
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  _ContactItem({Key key, this.icon, this.lines, this.tooltip, this.onPressed})
      : assert(lines.length > 1),
        super(key: key);

  final IconData icon;
  final List<String> lines;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final List<Widget> columnChildren = lines
        .sublist(0, lines.length - 1)
        .map((String line) => new Text(line))
        .toList();
    columnChildren
        .add(new Text(lines.last, style: themeData.textTheme.caption));

    final List<Widget> rowChildren = <Widget>[
      new Expanded(
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: columnChildren))
    ];
    if (icon != null) {
      rowChildren.add(new SizedBox(
          width: 72.0,
          child: new IconButton(
              icon: new Icon(icon),
              color: themeData.primaryColor,
              onPressed: onPressed)));
    }
    return new MergeSemantics(
      child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: rowChildren)),
    );
  }
}

class ContactsDemo extends StatefulWidget {

  @override
  ContactsDemoState createState() => new ContactsDemoState();
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class ContactsDemoState extends State<ContactsDemo> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();
  final double _appBarHeight = 220.0;

  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  @override
  Widget build(BuildContext context) {
    return new Theme(
      data: new ThemeData(
        brightness: Brightness.light,
        platform: Theme.of(context).platform,
      ),
      child: new Scaffold(
        key: _scaffoldKey,
        body: new CustomScrollView(
          slivers: <Widget>[
            new SliverAppBar(
              expandedHeight: _appBarHeight,
              pinned: _appBarBehavior == AppBarBehavior.pinned,
              floating: _appBarBehavior == AppBarBehavior.floating ||
                  _appBarBehavior == AppBarBehavior.snapping,
              snap: _appBarBehavior == AppBarBehavior.snapping,
              actions: <Widget>[
                new PopupMenuButton<AppBarBehavior>(
                  onSelected: (AppBarBehavior value) {
                    setState(() {
                      _appBarBehavior = value;
                    });
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuItem<AppBarBehavior>>[
                        const PopupMenuItem<AppBarBehavior>(
                            value: AppBarBehavior.normal,
                            child: const Text('App bar scrolls away')),
                        const PopupMenuItem<AppBarBehavior>(
                            value: AppBarBehavior.pinned,
                            child: const Text('App bar stays put')),
                        const PopupMenuItem<AppBarBehavior>(
                            value: AppBarBehavior.floating,
                            child: const Text('App bar floats')),
                        const PopupMenuItem<AppBarBehavior>(
                            value: AppBarBehavior.snapping,
                            child: const Text('App bar snaps')),
                      ],
                ),
              ],
              flexibleSpace: new FlexibleSpaceBar(
                title: const Text('User profile'),
                background: new Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    new Image.asset(
                      'res/images/material_design_3.png',
                      fit: BoxFit.fill,
                      height: _appBarHeight,
                    ),
                    // This gradient ensures that the toolbar icons are distinct against the background image.
                    const DecoratedBox(
                      decoration: const BoxDecoration(
                        gradient: const LinearGradient(
                          begin: const Alignment(0.0, -1.0),
                          end: const Alignment(0.0, -0.4),
                          colors: const <Color>[
                            const Color(0x60000000),
                            const Color(0x00000000)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
                new _ContactCategory(
                  icon: Icons.call,
                  children: <Widget>[
                    new _ContactItem(
                      icon: Icons.message,
                      tooltip: 'Send message',
                      onPressed: () {},
                      lines: const <String>[
                        '+1-234-5678901',
                        'Mobile',
                      ],
                    ),
                    new _ContactItem(
                      icon: Icons.message,
                      tooltip: 'Send message',
                      onPressed: () {},
                      lines: const <String>[
                        '+1-234-5678902',
                        'Work',
                      ],
                    ),
                    new _ContactItem(
                      icon: Icons.message,
                      tooltip: 'Send message',
                      onPressed: () {},
                      lines: const <String>[
                        '+1-234-5678903',
                        'Home',
                      ],
                    ),
                  ],
                ),
                new _ContactCategory(
                  icon: Icons.contact_mail,
                  children: <Widget>[
                    new _ContactItem(
                      icon: Icons.email,
                      tooltip: 'Send personal e-mail',
                      onPressed: () {},
                      lines: const <String>[
                        'user.personal@email.com',
                        'Personal',
                      ],
                    ),
                    new _ContactItem(
                      icon: Icons.email,
                      tooltip: 'Send work e-mail',
                      onPressed: () {},
                      lines: const <String>[
                        'user.work@email.com',
                        'Work',
                      ],
                    ),
                  ],
                ),
                new _ContactCategory(
                  icon: Icons.location_on,
                  children: <Widget>[
                    new _ContactItem(
                      icon: Icons.map,
                      tooltip: 'Open map',
                      onPressed: () {},
                      lines: const <String>[
                        'Home Street',
                        'San Francisco, CA',
                        'Home',
                      ],
                    ),
                    new _ContactItem(
                      icon: Icons.map,
                      tooltip: 'Open map',
                      onPressed: () {},
                      lines: const <String>[
                        'Work Parkway',
                        'Los Angeles, CA',
                        'Work',
                      ],
                    ),
                  ],
                ),
                new _ContactCategory(
                  icon: Icons.today,
                  children: <Widget>[
                    new _ContactItem(
                      lines: const <String>[
                        'Birthday',
                        'November 27th, 1992',
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
