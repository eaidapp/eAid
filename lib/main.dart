import 'package:eaid/account/account.dart';
import 'package:eaid/services/auth.dart';
import 'package:flutter/material.dart';
import 'home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print(e.toString());
  }

  runApp(const EAid());
}

class EAid extends StatelessWidget {
  const EAid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Account?>.value(
      initialData: null,
      value: AuthService().account,
      child: MaterialApp(
        title: 'eAid',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Sans',
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MyHomePage(title: 'eAid'),
      ),
    );
  }
}
