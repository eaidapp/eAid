import 'package:flutter/material.dart';
import 'request.dart';
import 'request_detail.dart';
import 'nav_drawer.dart';

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
      ),
      drawer: NavDrawer(),
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
          },
        ),
      ),
    );
  }

  Widget buildNoticeCard(Request request) {
    return Card(
//  how high off the screen the card is
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              request.requestTitle,
              style: const TextStyle(fontSize: 18),
            ),
            Image(image: AssetImage(request.requestImage)),
            const SizedBox(
              height: 14.0,
            ),
            Text(
              request.requestSummary,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            )
          ],
        ),
      ),
    );
  }
}
