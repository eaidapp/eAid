import 'package:eaid/home/loading.dart';
import 'package:eaid/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../account/account.dart';

class CreateRequest extends StatefulWidget {
  const CreateRequest({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CreateRequestState();
  }
}

class CreateRequestState extends State<CreateRequest> {
  bool loading = false;

  final TextEditingController _phoneFilter = TextEditingController();
  final TextEditingController _amountFilter = TextEditingController();
  final TextEditingController _requestTitleFilter = TextEditingController();
  final TextEditingController _requestImageFilter = TextEditingController();
  final TextEditingController _requestDescriptionFilter =
      TextEditingController();
  String phone = '';
  int amount = 0;
  int amountDonated = 0;
  String requestTitle = '';
  String requestImage = '';
  String requestDescription = '';

  _CreateRequestState() {
    _phoneFilter.addListener(_phoneListen);
    _amountFilter.addListener(_amountListen);
    _requestTitleFilter.addListener(_requestTitleListen);
    _requestImageFilter.addListener(_requestImageListen);
    _requestDescriptionFilter.addListener(_requestDescriptionListen);
  }

  void _phoneListen() {
    if (_phoneFilter.text.isEmpty) {
      phone = "";
    } else {
      phone = _phoneFilter.text;
    }
  }

  void _amountListen() {
    if (_amountFilter.text.isEmpty) {
      amount = 0;
    } else {
      amount = int.parse(_amountFilter.text);
    }
  }

  void _requestTitleListen() {
    if (_requestTitleFilter.text.isEmpty) {
      requestTitle = "";
    } else {
      requestTitle = _requestTitleFilter.text;
    }
  }

  void _requestImageListen() {
    if (_requestImageFilter.text.isEmpty) {
      requestImage = "";
    } else {
      requestImage = _requestImageFilter.text;
    }
  }

  void _requestDescriptionListen() {
    if (_requestDescriptionFilter.text.isEmpty) {
      requestDescription = "";
    } else {
      requestDescription = _requestDescriptionFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Account?>(context);

    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: const Text("Create a Fundraiser"),
            ),
            body: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  _buildTextFields(),
                  Container(
                    child: Column(children: <Widget>[
                      ElevatedButton(
                        child: const Text('Create Fundraiser'),
                        onPressed: () async {
                          //setState(() => loading = true);
                          await DatabaseService(uid: user!.uid).updateUserData(
                            requestTitle,
                            requestDescription,
                            requestImage,
                            phone,
                            amount,
                            amountDonated,
                          );
                        },
                      ),
                    ]),
                  )
                ],
              ),
            ),
          );
  }

  Widget _buildTextFields() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: TextField(
              controller: _phoneFilter,
              decoration: const InputDecoration(labelText: 'Phone number'),
            ),
          ),
          Container(
            child: TextField(
              controller: _amountFilter,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Amount(UGX)'),
            ),
          ),
          Container(
            child: TextField(
              controller: _requestTitleFilter,
              decoration:
                  const InputDecoration(labelText: 'Title of the fundraiser'),
            ),
          ),
          Container(
            child: TextField(
              controller: _requestDescriptionFilter,
              decoration:
                  const InputDecoration(labelText: 'Why you are fundraising'),
            ),
          ),
          Container(
            child: TextField(
              controller: _requestImageFilter,
              decoration: const InputDecoration(labelText: 'image'),
            ),
          ),
        ],
      ),
    );
  }
}
