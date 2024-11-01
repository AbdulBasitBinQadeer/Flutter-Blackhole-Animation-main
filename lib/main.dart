import 'package:counter_animation/back_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Colors.white,
      home: BackScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
