import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({Key? key}) : super(key: key);

  @override
  _WithdrawState createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _bank = TextEditingController();
  final TextEditingController _accountNumber = TextEditingController();
  final TextEditingController _amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Withdrawal request")),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: _bank,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: "Bank",
                  ),
                  validator: (value) =>
                      value!.isNotEmpty ? null : "Bank is required",
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: _accountNumber,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(hintText: "Account Number"),
                  validator: (value) =>
                      value!.isNotEmpty ? null : "Account number is required",
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: RawMaterialButton(
                  onPressed: _validateInPut,
                  fillColor: Colors.deepPurple,
                  child: const Text(
                    "Send withdraw request",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _validateInPut() {
    final bank = _bank.text;
    final accountNumber = _accountNumber.text;
    if (formKey.currentState!.validate()) {
      sendTransferRequest(context, bank.trim(), accountNumber.trim());
    }
  }

  var uuid = const Uuid();
  Future<void> sendTransferRequest(
      BuildContext context, String bank, String accountNumber) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer FLWSECK-887df063da7179183628b3eca3215695-X'
      };
      var request = http.Request(
          'POST', Uri.parse('https://api.flutterwave.com/v3/transfers'));
      request.body = json.encode({
        "account_bank": bank,
        "account_number": accountNumber,
        "amount": "5000",
        "narration": "Akhlm Pstmn Trnsfr xx007",
        "currency": "NGN",
        "reference": uuid.v4(),
        "callback_url":
            "https://webhook.site/b3e505b0-fe02-430e-a538-22bbbce8ce0d",
        "debit_currency": "NGN"
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        showLoading("Request sent successfully");
      } else {
        showLoading("Request failed");
      }
    } catch (error) {
      showLoading("Request not sent");
    }
  }

  Future<void> showLoading(String message) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            width: double.infinity,
            height: 50,
            child: Text(message),
          ),
        );
      },
    );
  }
}
