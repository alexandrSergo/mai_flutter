import 'package:flutter/material.dart';
import 'package:mai_app/features/docList/view/screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
