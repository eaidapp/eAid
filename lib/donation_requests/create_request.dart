import 'package:flutter/material.dart';

class CreateRequest extends StatefulWidget {
  const CreateRequest({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CreateRequestState();
  }
}

class CreateRequestState extends State<CreateRequest> {
  final TextEditingController _phoneFilter = TextEditingController();
  final TextEditingController _amountFilter = TextEditingController();
  final TextEditingController _requestTitleFilter = TextEditingController();
  final TextEditingController _requestImageFilter = TextEditingController();
  final TextEditingController _requestDescriptionFilter =
      TextEditingController();
  String? _phone;
  String? _amount;
  String? requestTitle;
  String? requestImage;
  String? requestDescription;

  _CreateRequestState() {
    _phoneFilter.addListener(_phoneListen);
    _amountFilter.addListener(_amountListen);
    _requestTitleFilter.addListener(_requestTitleListen);
    _requestImageFilter.addListener(_requestImageListen);
    _requestDescriptionFilter.addListener(_requestDescriptionListen);
  }

  void _phoneListen() {
    if (_phoneFilter.text.isEmpty) {
      _phone = "";
    } else {
      _phone = _phoneFilter.text;
    }
  }

  void _amountListen() {
    if (_amountFilter.text.isEmpty) {
      _amount = "";
    } else {
      _amount = _amountFilter.text;
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a Fundraiser"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButton(),
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

  Widget _buildButton() {
    return Container(
      child: Column(children: <Widget>[
        ElevatedButton(
          child: const Text('Create Fundraiser'),
          onPressed: _ButtonPressed,
        ),
      ]),
    );
  }

  void _ButtonPressed() {
    print(
        'The user wants to donate with Phone number $_phone an amount $_amount');
    //Navigator.of(context).push(MaterialPageRoute(builder: (_) => Dashboard()));
  }
}
