import 'package:flutter/material.dart';

class MyGradient extends StatelessWidget {
  final Widget child;
  const MyGradient({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple,
                Colors.deepPurple,
              ],
              end: Alignment.topLeft,
              begin: Alignment.bottomRight,
            ),
          ),
          child: child,
    );
  }
}