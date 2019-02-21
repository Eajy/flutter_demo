import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  List<String> items = new List<String>.generate(30, (i) => "Item ${(i + 1)}");

  @override
  State<StatefulWidget> createState() {
    return new ListPageState(items: items);
  }
}

class ListPageState extends State<ListPage> {
  ListPageState({this.items});

  final List<String> items;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  Future<Null> _handleRefresh() {
    final Completer<Null> completer = new Completer<Null>();
    new Timer(const Duration(seconds: 2), () {
      completer.complete(null);
    });
    return completer.future.then((_) {
      _scaffoldKey.currentState?.showSnackBar(
        new SnackBar(
          content: const Text('Refresh complete'),
          action: new SnackBarAction(
            label: 'RETRY',
            onPressed: () {
              _refreshIndicatorKey.currentState.show();
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text('List'),
      ),
      body: new RefreshIndicator(
        color: Colors.amber,
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        child: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return new Dismissible(
              key: new Key(item),
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                  Scaffold.of(context).showSnackBar(
                        new SnackBar(content: new Text("$item dismissed")),
                      );
                });
              },
              background: new Container(
                color: Colors.red,
                child: const ListTile(
                    leading: const Icon(Icons.delete, color: Colors.white)),
              ),
              secondaryBackground: new Container(
                color: Colors.red,
                child: const ListTile(
                    trailing: const Icon(Icons.delete, color: Colors.white)),
              ),
              child: new ListTile(
                leading: new CircleAvatar(
                  backgroundColor: Colors.amber,
                  child:
                      new Icon(Icons.fiber_manual_record, color: Colors.white),
                ),
                title: new Text('$item'),
                subtitle: new Text('Pull to refresh. Swipe to dismiss.'),
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
