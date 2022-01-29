import 'package:flutter/material.dart';
import '../nav_bar/nav_drawer.dart';

class contact extends StatelessWidget {
  static const String routeName = '/about';

  contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("eAid"),
        ),
        drawer: NavDrawer(),
        body: const Center(child: Text("A mobile donation platform")));
  }
}
