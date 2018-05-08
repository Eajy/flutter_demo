import 'package:flutter/material.dart';
import 'package:flutter_demo/route/about.dart';
import 'package:flutter_demo/route/bottomNavigation.dart';
import 'package:flutter_demo/route/fullscreen.dart';
import 'package:flutter_demo/route/list.dart';
import 'package:flutter_demo/route/settings.dart';
import 'package:flutter_demo/route/sliverAppbar.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
//          new MyDrawerHeader(),
          new UserAccountsDrawerHeader(
            accountName: new Text('User Name'),
            accountEmail: new Text('user.name@email.com'),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.amber,
              child: new FlutterLogo(size: 42.0),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.list),
            title: const Text('List'),
            onTap: () {
              Navigator.pop(context); //  close drawer
              Navigator.push(context, new MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return new ListPage();
                },
              ));
            },
          ),
          new ListTile(
            leading: const Icon(Icons.vertical_align_top),
            title: const Text('Sliver Appbar'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, new MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return new ContactsDemo();
                },
              ));
            },
          ),
          new ListTile(
            leading: const Icon(Icons.fullscreen),
            title: const Text('Full Screen'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) {
                  return new Fullscreen();
                },
              ));
            },
          ),
          new ListTile(
            leading: const Icon(Icons.more_horiz),
            title: const Text('Bottom Navigation'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, new MaterialPageRoute(
                builder: (BuildContext context) {
                  return new BottomNavigationDemo();
                },
              ));
            },
          ),
          new ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, new MaterialPageRoute(
                builder: (BuildContext context) {
                  return new Settings();
                },
              ));
            },
          ),
          new Divider(),
          new ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, new MaterialPageRoute(
                builder: (BuildContext context) {
                  return new About();
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}

class MyDrawerHeader extends StatefulWidget {
  const MyDrawerHeader({Key key}) : super(key: key);

  @override
  _MyDrawerHeaderState createState() => new _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyDrawerHeader> {
//  bool _logoHasName = true;
//  bool _logoHorizontal = true;
//  MaterialColor _logoColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Semantics(
      label: 'Flutter',
      child: new DrawerHeader(
//        decoration: new FlutterLogoDecoration(
//          margin: new EdgeInsets.fromLTRB(
//              12.0, 12.0 + systemTopPadding, 12.0, 12.0),
//          style: _logoHasName
//              ? _logoHorizontal
//                  ? FlutterLogoStyle.horizontal
//                  : FlutterLogoStyle.stacked
//              : FlutterLogoStyle.markOnly,
//          lightColor: _logoColor.shade400,
//          darkColor: _logoColor.shade900,
//          textColor: const Color(0xFF616161),
//        ),
//        duration: const Duration(milliseconds: 500),
//        child: new GestureDetector(
//          onLongPress: () {
//            setState(() {
//              _logoHorizontal = !_logoHorizontal;
//              if (!_logoHasName) _logoHasName = true;
//            });
//          },
//          onTap: () {
//            setState(() {
//              _logoHasName = !_logoHasName;
//            });
//          },
//          onDoubleTap: () {
//            setState(() {
//              final List<MaterialColor> options = <MaterialColor>[];
//              if (_logoColor != Colors.blue)
//                options.addAll(<MaterialColor>[Colors.blue, Colors.blue, Colors.blue, Colors.blue, Colors.blue, Colors.blue, Colors.blue]);
//              if (_logoColor != Colors.amber)
//                options.addAll(<MaterialColor>[Colors.amber, Colors.amber, Colors.amber]);
//              if (_logoColor != Colors.red)
//                options.addAll(<MaterialColor>[Colors.red, Colors.red, Colors.red]);
//              if (_logoColor != Colors.indigo)
//                options.addAll(<MaterialColor>[Colors.indigo, Colors.indigo, Colors.indigo]);
//              if (_logoColor != Colors.pink)
//                options.addAll(<MaterialColor>[Colors.pink]);
//              if (_logoColor != Colors.purple)
//                options.addAll(<MaterialColor>[Colors.purple]);
//              if (_logoColor != Colors.cyan)
//                options.addAll(<MaterialColor>[Colors.cyan]);
//              _logoColor = options[new math.Random().nextInt(options.length)];
//            });
//          }
//        ),

        padding: const EdgeInsets.all(0.0),
        child: new Container(
          color: Color(0x33000000),
          padding: const EdgeInsets.all(16.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new FlutterLogo(
                size: 64.0,
              ),
              new Text(
                'To Start Login',
                style: new TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
