import 'package:eaid/account/account.dart';
import 'package:eaid/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create account object based on User
  Account? _accountFromUser(User? account) {
    return account != null ? Account(uid: account.uid) : null;
  }

  //auth change user stream
  Stream<Account?> get account {
    return _auth.authStateChanges().map(_accountFromUser);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in email and password
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _accountFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password

  Future signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      return _accountFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //create fundraiser
  Future createFundraiser() async {}

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
