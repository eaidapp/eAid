import 'package:flutter/material.dart';
import '../nav_bar/nav_drawer.dart';

class Contact extends StatelessWidget {
  static const String routeName = '/about';

  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("eAid"),
        ),
        drawer: const NavDrawer(),
        body: const Center(child: Text("A mobile donation platform")));
  }
}
