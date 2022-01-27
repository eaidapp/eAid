import 'package:flutter/material.dart';
import 'home/home.dart';

void main() {
  runApp(const EAid());
}

class EAid extends StatelessWidget {
  const EAid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'eAid',
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.deepPurple,
          secondary: Colors.purpleAccent,
        ),
      ),
      home: const MyHomePage(title: 'eAid'),
    );
  }
}
