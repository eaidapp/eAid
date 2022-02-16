import 'package:flutter/material.dart';
import '../nav_bar/nav_drawer.dart';

class Contact extends StatelessWidget {
  static const String routeName = '/about';

  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      drawer: const NavDrawer(),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Text(
            "eAid is an online mobile donation platform. It was created to give a voice to anyone in need of financial help in Uganda.\nThis application supports Uganda's Mobile money services which are the most popular non-physical transaction technologies in this country.\nThank you for joining us!\n\neAid app team",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
              fontFamily: 'Arial',
            ),
          ),
        ),
      ),
    );
  }
}
