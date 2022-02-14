import 'package:eaid/donation_requests/request_list.dart';

import '/donation_requests/request.dart';
import 'card.dart';
import 'package:flutter/material.dart';
import '/donation_requests/request_detail.dart';
import '../nav_bar/nav_drawer.dart';
import 'search_page.dart';
import '/services/database.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Request>>.value(
      initialData: [],
      value: DatabaseService().requests,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            // Navigate to the Search Screen
            IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const SearchPage())),
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        drawer: const NavDrawer(),
        body: const SafeArea(child: RequestList()),
      ),
    );
  }
}
