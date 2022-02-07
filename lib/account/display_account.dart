import 'package:eaid/home/loading.dart';
import 'package:eaid/services/auth.dart';
import '/donation_requests/create_request.dart';
import 'package:flutter/material.dart';
import '/donation_requests/request_detail.dart';
import '/home/card.dart';
import '/donation_requests/request.dart';
import '/donation/donation.dart';

class DisplayAccount extends StatefulWidget {
  @override
  _DisplayAccountState createState() {
    return _DisplayAccountState();
  }
}

class _DisplayAccountState extends State<DisplayAccount> {
  final AuthService _auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: const Text(
                "Account",
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    setState(() => loading = true);
                    await _auth.signOut();
                  },
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 25, 16, 25),
                      child: Text('Email: '),
                    ),
                    const Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 16, 25),
                      child: Text('Password: '),
                    ),
                    const Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 16, 25),
                      child: Text('Fundraisers: '),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        child: const Text('Create a Fundraiser'),
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => const CreateRequest())),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
