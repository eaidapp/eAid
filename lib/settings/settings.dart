import 'package:flutter/material.dart';
import '../nav_bar/nav_drawer.dart';

class Profile extends StatelessWidget {
  static const String routeName = '/settings';

  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        drawer: const NavDrawer(),
        body: const Center(child: Text("This is the settings page")));
  }
}
