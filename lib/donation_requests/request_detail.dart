import 'package:flutter/material.dart';
import 'request.dart';
import '/donation/donation.dart';

class RequestDetail extends StatefulWidget {
  final Request request;
  const RequestDetail({
    Key? key,
    required this.request,
  }) : super(key: key);

  @override
  _RequestDetailState createState() {
    return _RequestDetailState();
  }
}

class _RequestDetailState extends State<RequestDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fundraiser"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image(
                  image: AssetImage(widget.request.requestImage),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                child: SizedBox(
                  height: 50,
                  child: Text(
                    widget.request.requestTitle,
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 5, 16, 16),
                child: Text(
                  widget.request.requestDescription,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: const Text('Donate'),
                  onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Donation())),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 5, 16, 16),
                child: Text(
                  "3M collected",
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: LinearProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
