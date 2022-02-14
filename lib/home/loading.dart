import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      child: const Center(
        child: SizedBox(
          width: 80,
          height: 80,
          child: CircularProgressIndicator(
            color: Colors.deepPurple,
            strokeWidth: 5.0,
          ),
        ),
      ),
    );
  }
}
