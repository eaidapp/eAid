import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurpleAccent,
      child: const Center(
        child: CircularProgressIndicator(
          color: Color.fromARGB(255, 199, 189, 214),
          strokeWidth: 5.0,
        ),
      ),
    );
  }
}
