import 'package:flutter/material.dart';

class Fullscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Stack(
          children: <Widget>[
            new Image.asset(
              'res/gif/material_design_flutter_1.gif',
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
