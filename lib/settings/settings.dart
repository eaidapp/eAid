import 'package:flutter/material.dart';
import '../nav_bar/nav_drawer.dart';

class profile extends StatelessWidget {
  static const String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        drawer: NavDrawer(),
        body: Center(child: Text("This is the settings page")));
  }
}
