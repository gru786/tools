import 'package:flutter/material.dart';
import 'package:tools/screens/home_screen.dart';
import 'package:tools/screens/password_generator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      useInheritedMediaQuery: true,
      title: 'Tools',
      routes: {
        '/' : (context) =>  HomeScreen(),
        '/password_generator' : (context) => PasswordGeneratorScreen(),

      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(


        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: Colors.grey[800],


      ),


    );
  }
}
