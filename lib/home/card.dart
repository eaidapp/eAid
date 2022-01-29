import 'package:flutter/material.dart';
import '/donation_requests/request.dart';

Widget buildNoticeCard(Request request) {
  return Card(
//  how high off the screen the card is
    elevation: 100,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    borderOnForeground: false,
    child: Padding(
      padding: EdgeInsets.fromLTRB(0, 35.0, 0, 16.0),
      child: Column(
        children: <Widget>[
          // Text(
          //   request.requestTitle,
          //   style: const TextStyle(fontSize: 18),
          // ),
          Image(image: AssetImage(request.requestImage)),
          const SizedBox(
            height: 14.0,
          ),
          Text(
            request.requestTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 15.0,
              fontWeight: FontWeight.w100,
              fontFamily: 'Arial',
            ),
          )
        ],
      ),
    ),
  );
}
