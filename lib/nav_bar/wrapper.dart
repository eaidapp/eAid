import 'package:eaid/account/account.dart';
import 'package:eaid/account/display_account.dart';
import 'package:eaid/account/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Account?>(context);

    //returns either sign in or account
    if (user == null) {
      return SignIn();
    } else {
      return DisplayAccount();
    }
  }
}
