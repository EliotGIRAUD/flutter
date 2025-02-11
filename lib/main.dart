import 'package:flutter/material.dart';
import './screens/exo1.dart';
import './screens/exo2.dart';
import './screens/exo3.dart';
import './screens/exo4.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Ex4Screen(),
    );
  }
}
