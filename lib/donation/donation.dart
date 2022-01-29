import 'package:flutter/material.dart';

class Donation extends StatefulWidget {
  const Donation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DonationState();
  }
}

class DonationState extends State<Donation> {
  final TextEditingController _phoneFilter = TextEditingController();
  final TextEditingController _amountFilter = TextEditingController();
  String _phone = "";
  String _amount = "";

  _DonationState() {
    _phoneFilter.addListener(_phoneListen);
    _amountFilter.addListener(_amountListen);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Donation"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButton(),
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(35.0, 100.0, 35.0, 1),
                  child: Text("Donating With"),
                ),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: SizedBox(
                    height: 90,
                    width: 200,
                    child: Image(
                      image: AssetImage("images/momo.jpg"),
                    ),
                  ),
                ),
              ],
            ),
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
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
          ),
          Container(
            child: TextField(
              controller: _amountFilter,
              decoration: InputDecoration(labelText: 'Amount'),
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
          child: Text('Donate'),
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
