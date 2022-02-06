import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';

class Donation extends StatefulWidget {
  Donation({Key? key}) : super(key: key);

  @override
  _DonationState createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();

  String? _ref;

  void setRef() {
    Random rand = Random();
    int number = rand.nextInt(2000);

    if (Platform.isAndroid) {
      setState(() {
        _ref = "AndroidRef1789$number";
      });
    } else {
      setState(() {
        _ref = "IOSRef1789$number";
      });
    }
  }

  @override
  void initState() {
    setRef();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Authorise donation")),
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
                  controller: _phone,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: "Phone Number",
                  ),
                  validator: (value) =>
                      value!.isNotEmpty ? null : "Phone number is required",
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: _amount,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(hintText: "Amount"),
                  validator: (value) =>
                      value!.isNotEmpty ? null : "Amount is required",
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: _email,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(hintText: "Email"),
                  validator: (value) =>
                      value!.isNotEmpty ? null : "Email is required",
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
                    "Donate",
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
    final amount = _amount.text;
    final phone = _phone.text;
    final email = _email.text;

    if (formKey.currentState!.validate()) {
      _makePayment(context, amount.trim(), phone.trim(), email.trim());
    }
  }

  void _makePayment(
      BuildContext context, String amount, String phone, String email) async {
    try {
      Flutterwave flutterwave = Flutterwave.forUIPayment(
        context: this.context,
        encryptionKey: "887df063da713ee23768121b",
        publicKey: "FLWPUBK-1b1ee617c9478ac791782abdcf37fe22-X",
        currency: "UGX",
        amount: amount,
        email: email,
        fullName: "Ronald Ampurire",
        txRef: _ref!,
        isDebugMode: false,
        phoneNumber: phone,
        acceptCardPayment: true,
        acceptAccountPayment: true,
        acceptUgandaPayment: true,
      );
      final ChargeResponse response =
          await flutterwave.initializeForUiPayments();

      if (response != null) {
        showLoading("Success");
      } else {
        showLoading("No Response!");
      }
    } catch (error) {
      showLoading("error");
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
