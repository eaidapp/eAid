import 'package:eaid/account/account.dart';
import 'package:flutter/material.dart';

Widget RequestTile(UserData userData) {
  String amountDonated = userData.amountDonated.toString();
  String amount = userData.amount.toString();
  double percentageDonated = userData.amountDonated / userData.amount;

  return SizedBox(
    //width: ,
    height: 250,
    child: Card(
      elevation: 100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      borderOnForeground: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 8.0,
            ),
            Text(
              userData.requestTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
                fontFamily: 'Arial',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 7,
                child: LinearProgressIndicator(
                  backgroundColor: Color.fromARGB(255, 204, 181, 244),
                  value: percentageDonated,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Collected: UGX $amountDonated",
                textAlign: TextAlign.left,
              ),
            ),
            Text(
              "Target: UGX $amount ",
              textAlign: TextAlign.left,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Fundraiser Contact: ${userData.phone}",
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
