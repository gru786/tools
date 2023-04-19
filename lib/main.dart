import 'package:flutter/material.dart';
import 'package:tools/screens/age_calculator_screen.dart';
import 'package:tools/screens/bmi_calculator_screen.dart';
import 'package:tools/screens/calculator_screen.dart';
import 'package:tools/screens/discount_calculator_screen.dart';
import 'package:tools/screens/emi_calculator_screen.dart';
import 'package:tools/screens/home_screen.dart';
import 'package:tools/screens/password_generator_screen.dart';
import 'package:tools/screens/qr_codegenerator_screen.dart';
import 'package:tools/screens/stopwatch_screen.dart';
import 'package:tools/screens/tip_calculator_screen.dart';
import 'package:tools/screens/unit_converter_screen.dart';
import 'package:tools/screens/words_counter_screen.dart';

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
        '/': (context) => HomeScreen(),
        '/password_generator': (context) => PasswordGeneratorScreen(),
        '/bmi_calculator': (context) => BmiCalculatorScreen(),
        '/age_calculator': (context) => AgeCalculatorScreen(),
        '/qr_code_generator': (context) => QRCodeGeneratorScreen(),
        '/stopwatch_screen': (context) => StopwatchScreen(),
        '/unit_converter_screen': (context) => UnitConverterScreen(),
        '/reminder_screen': (context) => WordsCounterScreen(),
        '/emi_calculator_screen': (context) => EmiCalculatorScreen(),
        '/discount_calculator_screen': (context) => DiscountCalculatorScreen(),
        '/tip_calculator_screen': (context) => TipCalculatorScreen(),
        '/calculator_screen': (context) => CalculatorScreen(),
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
