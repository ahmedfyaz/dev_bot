import 'package:chat_app/bloc/dev_bloc.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.grey.shade900,
            primaryColor: Colors.purple.shade900),
        home: BlocProvider(
          create: (context) => DevBloc(),
          child: const HomeScreen(),
        ));
  }
}
