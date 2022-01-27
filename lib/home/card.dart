import 'package:flutter/material.dart';
import '/donation_requests/request.dart';

Widget buildNoticeCard(Request request) {
  return Card(
//  how high off the screen the card is
    elevation: 2.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11.0)),

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
