import 'dart:io';
import 'package:eaid/home/loading.dart';
import 'package:eaid/services/database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../account/account.dart';

class CreateRequest extends StatefulWidget {
  const CreateRequest({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CreateRequestState();
  }
}

class _CreateRequestState extends State<CreateRequest> {
  File? imageFile;
  bool loading = false;
  final _formKey = GlobalKey<FormState>();

  String phone = '';
  int amount = 1;
  int amountDonated = 0;
  String requestTitle = '';
  String requestImage = '';
  String requestDescription = '';
  String error = 'All the fields are required';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Account?>(context);
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: const Text("Create a Fundraiser"),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    _buildTextFields(),
                    Column(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: imageBox(user!.uid),
                      ),
                      ElevatedButton(
                        child: const Text('Create Fundraiser'),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // setState(() {
                            //   loading = true;
                            // });
                            await DatabaseService(uid: user.uid).updateUserData(
                              requestTitle,
                              requestDescription,
                              requestImage,
                              phone,
                              amount,
                              amountDonated,
                            );
                          }
                        },
                      ),
                    ]),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      error,
                      style: const TextStyle(color: Colors.red, fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ),
          );
  }

  Widget _buildTextFields() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (value) => value!.isEmpty || value.length != 10
                ? 'Enter a valid Ugandan phone number'
                : null,
            onChanged: (value) => setState(() {
              phone = value;
            }),
            decoration: const InputDecoration(labelText: 'Phone number'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          TextFormField(
            validator: (value) =>
                value!.isEmpty || value == '0' ? 'Enter the amount' : null,
            onChanged: (value) => setState(() {
              amount = int.parse(value);
            }),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(labelText: 'Amount(UGX)'),
          ),
          TextFormField(
            validator: (value) =>
                value!.isEmpty ? 'Enter the title of your fundraiser' : null,
            onChanged: (value) => setState(() {
              requestTitle = value;
            }),
            decoration:
                const InputDecoration(labelText: 'Title of the fundraiser'),
          ),
          TextFormField(
            validator: (value) =>
                value!.isEmpty ? 'Enter the short description' : null,
            onChanged: (value) => setState(() {
              requestDescription = value;
            }),
            decoration:
                const InputDecoration(labelText: 'Why you are fundraising'),
          ),
        ],
      ),
    );
  }

  Future getUrl() async {
    final user = Provider.of<Account?>(context);
    final ref = FirebaseStorage.instance
        .ref()
        .child('images')
        .child(user!.uid + '.jpg');
    String imageUrl = (await ref.getDownloadURL()).toString();
    setState(() {
      requestImage = imageUrl;
    });
    print('upload task with ${user.uid}');
  }

  Widget imageBox(String uid) {
    return InkWell(
      onTap: (() async {
        return getFromGallery(uid);
      }),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
              width: 400,
              height: 200,
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Center(
                  child: imageWidget(),
                ),
              )),
        ),
      ),
    );
  }

  Widget imageWidget() {
    if (requestImage == null) {
      return const Text(
        'fundraiser image',
        style: TextStyle(color: Colors.grey),
      );
    } else {
      return Image(image: NetworkImage(requestImage));
    }
  }

  Future getFromGallery(String uid) async {
    print('getting pic with $uid');

    File imgFile = File(await ImagePicker()
        .pickImage(source: ImageSource.gallery)
        .then((pickedFile) => pickedFile!.path));

    setState(() {
      imageFile = imgFile;
    });
    uploadImage(uid);
  }

  Future uploadImage(String uid) async {
    final ref =
        FirebaseStorage.instance.ref().child('images').child('$uid.jpg');
    await ref.putFile(imageFile!);
    print('upload task with $uid');
    getUrl();
  }
}
