import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eaid/donation_requests/request_tile.dart';
import 'package:eaid/home/loading.dart';
import 'package:eaid/services/auth.dart';
import 'package:eaid/services/database.dart';
import 'package:provider/provider.dart';
import '/donation_requests/create_request.dart';
import 'package:flutter/material.dart';
import '/donation_requests/request_detail.dart';
import 'account.dart';

class DisplayAccount extends StatefulWidget {
  const DisplayAccount({Key? key}) : super(key: key);

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
    final user = Provider.of<Account?>(context);

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
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            body: StreamBuilder<UserData>(
                stream: DatabaseService(uid: user!.uid).userData,
                //this snapshot is not from firebase but from databaseService stream
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    UserData? userData = snapshot.data;
                    return SafeArea(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(25),
                                child: RequestTile(userData!)),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red),
                                  child: const Text(
                                    'Delete your Fundraiser',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: _deleteFundraiser),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return noFundraiserScreen();
                  }
                }),
          );
  }

  Future<void> _deleteFundraiser() async {
    final user = Provider.of<Account?>(context);
    var collection = FirebaseFirestore.instance.collection('fundraisers');
    var docSnapshot = collection.doc(user!.uid);
    await docSnapshot.delete();
  }

  Widget noFundraiserScreen() {
    return Center(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 58.0),
            child: Text(
                'You don\'t have an active fundraiser. Create one here!',
                style: TextStyle(color: Colors.grey)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 48.0),
            child: ElevatedButton(
              child: const Text('Create a Fundraiser'),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => CreateRequest())),
            ),
          ),
        ],
      ),
    );
  }
}
