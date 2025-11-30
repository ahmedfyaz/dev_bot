import 'package:chat_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey.shade900,
        primaryColor: Colors.deepPurple.shade300
      ),
      home: Scaffold(
        body: HomeScreen(
        ),
      ),
    );
  }
}
