import 'package:flutter/material.dart';
import '../nav_bar/nav_drawer.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Help"),
        ),
        drawer: const NavDrawer(),
        body: const Center(
            child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Text(
              "If you are facing any challenges with our system, please contact us on eaid@gmail.com\nYou will get feedback in less than 48 hours! ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
                fontFamily: 'Arial',
              )),
        )));
  }
}
