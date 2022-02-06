import 'package:eaid/nav_bar/wrapper.dart';
import 'package:flutter/material.dart';
import '../home/home.dart';
import '../about/about.dart';
import '../settings/settings.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Center(
              child: Row(
                children: const [
                  Expanded(
                    flex: 3,
                    child: Icon(
                      Icons.monetization_on,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      "eAid",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      // textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text("Home"),
            leading: IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const MyHomePage(
                    title: 'eAid',
                  ),
                ),
              );
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: const Text("Settings"),
            leading: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Profile()));
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: const Text("About"),
            leading: IconButton(
              icon: const Icon(Icons.contacts_rounded),
              onPressed: () {},
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Contact()));
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: const Text("Start a fundraiser"),
            leading: IconButton(
              icon: const Icon(Icons.manage_accounts_rounded),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Wrapper()));
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
