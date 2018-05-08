import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AboutState();
  }
}

class AboutState extends State<About> {
  static const platform = const MethodChannel('com.eajy.flutterdemo/android');

  static const app_url =
      'https://play.google.com/store/apps/details?id=com.eajy.flutterdemo';
  static const github_url = 'https://github.com/Eajy/flutter_demo';
  static const me_url = 'https://sites.google.com/view/eajy';

  String _version = 'Version:';

  Future<Null> _getVersionName() async {
    try {
      _version = await platform.invokeMethod('getVersionName');
    } on PlatformException catch (e) {
      print(e);
      _version = 'Version: 1.0';
    }
    setState(() {});
  }

  Future<Null> _share() async {
    try {
      platform.invokeMethod('share');
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<Null> _sendEmail() async {
    try {
      platform.invokeMethod('sendEmail');
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _getVersionName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('About'),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            leading: new FlutterLogo(),
            title: new Text('This app is developed by using Flutter.'),
            subtitle: new Text(_version),
          ),
          new Divider(),
          new ListTile(
            leading: new Icon(Icons.shop),
            title: new Text('Rate on Google Play'),
            onTap: () {
              launch(app_url);
            },
          ),
          new ListTile(
            leading: new Icon(Icons.code),
            title: new Text('Source code on GitHub'),
            onTap: () {
              launch(github_url);
            },
          ),
          new ListTile(
            leading: new Icon(Icons.email),
            title: new Text('Feedback by E-mail'),
            onTap: () {
              _sendEmail();
            },
          ),
          new ListTile(
            leading: new Icon(Icons.web),
            title: new Text('View my website'),
            onTap: () {
              launch(me_url);
            },
          ),
          new Divider(),
          new ListTile(
            leading: new Icon(
              Icons.info,
              color: Colors.transparent,
            ),
            title: new Text(
              'Designed by Eajy in China.',
              style: new TextStyle(color: Colors.black54, fontSize: 14.0),
            ),
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          _share();
        },
        child: new Icon(Icons.share, color: Colors.white),
      ),
    );
  }
}
