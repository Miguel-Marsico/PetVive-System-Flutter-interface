// Import the necessary Flutter material package and the HomeScreen widget.
import 'package:flutter/material.dart';
import 'home_screen.dart';

// The main function is the entry point for every Flutter app.
void main() {
  // runApp is a Flutter function that takes a Widget and makes it the root of the widget tree.
  runApp(MyApp());
}

// MyApp widget, which is stateless as it does not manage any state changes.
class MyApp extends StatelessWidget {
  @override
  // The build method describes the part of the user interface represented by the widget.
  Widget build(BuildContext context) {
    // MaterialApp is a widget that wraps a number of widgets that are commonly required for material design applications.
    return MaterialApp(
      title: 'Sistema PETVIVE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
