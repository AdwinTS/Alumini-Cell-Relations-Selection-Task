import 'package:flutter/material.dart';
import 'loading_screen.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoadingScreen(),  // Start with LoadingScreen
  ));
}
