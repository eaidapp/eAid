import 'package:flutter/material.dart';
import '/donation_requests/request.dart';

Widget RequestCard(Request request) {
  return Card(
    elevation: 100,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    borderOnForeground: false,
    child: SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 240,
              width: double.infinity,
              child: ClipRRect(
                //borderRadius: BorderRadius.circular(30.0),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Image(
                  image: NetworkImage(request.requestImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 14.0,
            ),
            Text(
              request.requestTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
                fontFamily: 'Arial',
              ),
            )
          ],
        ),
      ),
    ),
  );
}
