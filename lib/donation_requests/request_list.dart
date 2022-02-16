import 'package:eaid/donation_requests/request.dart';
import 'package:eaid/donation_requests/request_detail.dart';
import 'package:eaid/home/card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequestList extends StatefulWidget {
  const RequestList({Key? key}) : super(key: key);

  @override
  _RequestListState createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {
  @override
  Widget build(BuildContext context) {
    final requests = Provider.of<List<Request>>(context);

    return ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: requests.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RequestDetail(request: requests[index]);
                  },
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(13, 25, 13, 0),
              child: RequestCard(requests[index]),
            ),
          );
        });
  }
}
