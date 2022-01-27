import 'package:flutter/material.dart';
import 'request.dart';

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
        title: Text(widget.request.requestTitle),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.request.requestImage),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.request.requestDescription,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
