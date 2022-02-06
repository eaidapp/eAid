import '/donation_requests/request.dart';
import 'card.dart';
import 'package:flutter/material.dart';
import '/donation_requests/request_detail.dart';
import '../nav_bar/nav_drawer.dart';
import 'search_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(
        child: ListView.builder(
            itemCount: Request.samples.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RequestDetail(request: Request.samples[index]);
                      },
                    ),
                  );
                },
                child: buildNoticeCard(Request.samples[index]),
              );
            }),
      ),
    );
  }
}
